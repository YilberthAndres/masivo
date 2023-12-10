from cmath import nan
import re
from types import NoneType
from django.shortcuts import render, redirect
from django.http import JsonResponse
from mensajeria.models import (
    Archivos,
    Destinatarios,
    Personas,
    Maestras,
    Peticion,
    Paises,
    Areas,
    Secciones,
    Grupos
)
from mensajeria.forms import ArchivosForm
import os
from datetime import datetime
from django.conf import settings
import pandas as pd
import json
from django.http import HttpResponse
from openpyxl import Workbook


from rest_framework.generics import CreateAPIView, GenericAPIView
from ...mixins.base import ResponseMixin
from ...serializers.auth.signup_serializers import SignupSerializers
from ...serializers.auth.signin_serializers import SigninSerializers
from rest_framework.response import Response
from rest_framework import status

from django.shortcuts import render
from django.http import HttpResponse
from django.core.validators import validate_email
from django.core.exceptions import ValidationError


class Preparation(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers
    def get_validar_numero(self, numero):
        regex = r"\d{10}$"
        return re.match(regex, numero) is not None

    def get_binary_search(self, arr, target):
        left, right = 0, len(arr) - 1

        while left <= right:
            mid = (left + right) // 2

            if arr[mid] == target:
                return mid
            elif arr[mid] < target:
                left = mid + 1
            else:
                right = mid - 1

        return -1

    def get_data_null(self, txt):
        if txt is nan:
            return ""
        else:
            return txt

    def get_validar_campos(self, matriz):
        return [
            [str(x) if x is not None and not pd.isna(x) else "" for x in row]
            for row in matriz
        ]
    
    def get_pais(self, paises_validos, paises_codigo, pais):

        try:
            if pais == "Colombia":
                pais_id = 39
                codigo = paises_codigo[38]
            else:
                index = self.get_binary_search(paises_validos, pais)

                if index != -1:
                    pais_id = index + 1
                    codigo = paises_codigo[index]
                else:
                    pais_id = 39
                    codigo = paises_codigo[38]

        except ValueError:
            pais_id = 39
            codigo = paises_codigo[38]

        return pais_id, codigo


    def post(self, request, *args, **kwargs):

        try:
            if "archivo_excel_area" in request.FILES:
                archivo = request.FILES["archivo_excel_area"]
                if archivo.name.endswith((".xls", ".xlsx")):
                    df = pd.read_excel(archivo, engine="openpyxl")
                    matriz = df.values.tolist()

                    errados         = []
                    validos         = []
                    validos_celular = []
                    duplicados      = []
                    duplicados_add  = []
                    duplicados_docu = []

                    num_validos     = 0
                    num_duplicados  = 0
                    num_errados     = 0

                    personas_actuales   = Personas.objects.all().order_by("telefonowhatsapp")
                    paises_actuales     = Paises.objects.all().order_by("nombre")


                    paises_validos      = []
                    paises_codigo       = []
                    validos_actuales    = []
                    documentos_actuales = []


                    for pais_list in paises_actuales:
                        paises_validos.append(pais_list.nombre)
                        paises_codigo.append(pais_list.codigo)

                    
                    for persona in personas_actuales:
                        validos_actuales.append(persona.telefonowhatsapp)
                        documentos_actuales.append(persona.identificacion)

                    matriz_data = self.get_validar_campos(matriz)

                    for row in matriz_data:
                        nombre              = row[0].strip()
                        segundo_nombre      = row[1].strip()
                        apellido            = row[2].strip()
                        segundo_apellido    = row[3].strip()
                        celular             = row[4].strip()
                        pais                = row[5].strip()
                        documento           = row[6].strip()
                        tipoidentificacion  = row[7].strip()
                        fechanacimiento     = row[8].strip()
                        ocupacion           = row[9].strip()
                        area                = row[10].strip()
                        seccion             = row[11].strip()
                        grupo               = row[12].strip()


                        pais_id, codigo = self.get_pais(paises_validos, paises_codigo, pais)
                        try:
                            fechanacimiento = datetime.strptime(
                                fechanacimiento, "%Y-%m-%d %H:%M:%S"
                            ).date()
                            if fechanacimiento > datetime.now().date():
                                fechanacimiento = ""
                        except ValueError:
                            fechanacimiento = ""

                        if not isinstance(celular, str):
                            celular = str(celular)

                        documento = str(documento).rstrip(".0")

                        persona_new = {
                            "nombre": nombre,
                            "segundo_nombre": segundo_nombre,
                            "apellido": apellido,
                            "segundo_apellido": segundo_apellido,
                            "celular_whatsapp": celular,
                            "whatsapp_prefijo": codigo + celular,
                            "pais": pais_id,
                            "documento": documento,
                            "tipoidentificacion": tipoidentificacion,
                            "fechanacimiento": fechanacimiento,
                            "ocupacion": ocupacion,
                            "area": area,
                            "seccion": seccion,
                            "grupo": grupo,
                            "message": "",
                        }

                        if not self.get_validar_numero(persona_new["celular_whatsapp"]):
                            persona_new["message"] = "Numero de whatsapp invalido."
                            errados.append(persona_new)
                            num_errados = num_errados + 1
                        elif not self.get_validar_numero(persona_new["documento"]):
                            persona_new["message"] = "Numero de documento invalido."
                            errados.append(persona_new)
                            num_errados = num_errados + 1
                        else:
                            validos_celular.sort()
                            index_validos = self.get_binary_search(validos_celular, celular)

                            if index_validos != -1:
                                persona_new[
                                    "message"
                                ] = "Numero de whatsapp duplicado en el excel."
                                duplicados.append(persona_new)
                                num_duplicados = num_duplicados + 1
                            else:
                                index2 = self.get_binary_search(validos_actuales, celular)
                                if index2 != -1:
                                    persona_new[
                                        "message"
                                    ] = "Numero de whatsapp duplicado en la base de datos."
                                    duplicados.append(persona_new)
                                    num_duplicados = num_duplicados + 1
                                else:
                                    persona_new["message"] = "Datos correctos."
                                    validos_celular.append(celular)
                                    validos.append(persona_new)
                                    num_validos = num_validos + 1
                    data = {
                        "validos": {"count": num_validos, "data": validos},
                        "errados": {"count": num_errados, "data": errados},
                        "duplicados": {"count": num_duplicados, "data": duplicados},
                    }

                    self.data = data
            else:
                self.error  = "Archivo no encontrado"
                self.status = status.HTTP_400_BAD_REQUEST

        except Exception as e:
            self.error  = str(e)
            self.status = status.HTTP_400_BAD_REQUEST

        return Response(self.response_obj)



class Save(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers      

    def post_add_person(self, data, user):
        
        nueva_persona = Personas(
            nombre=data["nombre"],
            segundonombre=data["segundo_nombre"],
            apellido=data["apellido"],
            segundoapellido=data["segundo_apellido"],
            telefonomovil=data["celular_llamada"],
            telefonowhatsapp=data["celular_whatsapp"],
            identificacion=data["documento"],
            fechanacimiento=data["fechanacimiento"],
            pais_id=data["pais_id"],
            created_by=user,
        )

        nueva_persona.save()
        persona_id = nueva_persona.id
        print("Persona_id")
        print(persona_id)

        nuevo_registro = Destinatarios(
            persona_id=persona_id, created_by=user, estado_id=596, grupo_id = data["grupo_id"]
        )
        nuevo_registro.save()

        return True

    def get_binary_search(self, arr, target):
        left, right = 0, len(arr) - 1

        while left <= right:
            mid = (left + right) // 2

            if arr[mid] == target:
                return mid
            elif arr[mid] < target:
                left = mid + 1
            else:
                right = mid - 1

        return -1
    
    def get_search(self, lista, valor):
        try:
            index = lista.index(valor)
            return index
        except ValueError:
            return -1
    
    
    def post(self, request, *args, **kwargs):

            try:
                personas = request.data["destinatarios"]
                user = request.user
                validos = []
                num_validos = 0
                invalidos = []
                num_invalidos = 0

                areas_actuales      = Areas.objects.filter(estado_id=596).order_by("nombre")
                secciones_actuales  = Secciones.objects.filter(estado_id=596).order_by("nombre")
                grupos_actuales     = Grupos.objects.filter(estado_id=596).order_by("nombre")

                areas_listado           = []
                areas_listado_id        = []
                
                secciones_listado       = []
                secciones_listado_id    = []
                grupos_listado          = []
                grupos_listado_id       = []
                grupos_listado_info     = []

                for area_list in areas_actuales:
                    areas_listado_id.append(area_list.id)
                    areas_listado.append(area_list.nombre)

                for seccion_list in secciones_actuales:
                    secciones_listado_id.append(seccion_list.id)
                    secciones_listado.append(seccion_list.nombre)

                for grupos_list in grupos_actuales:
                    grupos_listado_id.append(grupos_list.id)
                    grupos_listado.append(grupos_list.nombre)

                
                areas_array     = []
                secciones_array = []
                grupos_array    = []
                for row_area in personas:
                    index_validos = self.get_search(areas_listado, row_area['area'])

                    if index_validos != -1:
                        area_id = areas_listado_id[index_validos]
                    else:
                        areas_listado.append(row_area["area"])

                        new_area                = Areas()
                        new_area.nombre         = row_area["area"]
                        new_area.descripcion    = ""
                        new_area.estado_id      = 596
                        new_area.created_by     = user
                        new_area.save()
                        area_id = new_area.id
                        areas_listado_id.append(area_id)

                    index_seccion = self.get_search(secciones_listado, row_area['seccion'])
                    if index_seccion != -1:
                        seccion_id = secciones_listado_id[index_seccion]
                    else:
                        secciones_listado.append(row_area['seccion'])

                        new_seccion                = Secciones()
                        new_seccion.nombre         = row_area['seccion']
                        new_seccion.area_id        = area_id
                        new_seccion.descripcion    = ""
                        new_seccion.estado_id      = 596
                        new_seccion.created_by     = user
                        new_seccion.save()
                        seccion_id = new_seccion.id
                        secciones_listado_id.append(seccion_id)

                    index_grupo = self.get_search(grupos_listado, row_area['grupo'])
                    if index_grupo != -1:
                        grupo_id = grupos_listado_id[index_grupo]
                    else:
                        grupos_listado.append(row_area['grupo'])

                        new_grupo                = Grupos()
                        new_grupo.nombre         = row_area['grupo']
                        new_grupo.area_id        = area_id
                        new_grupo.descripcion    = ""
                        new_grupo.estado_id      = 596
                        new_grupo.created_by     = user
                        new_grupo.save()
                        grupo_id = new_grupo.id
                        grupos_listado_id.append(grupo_id)

                    
                for persona in personas:

                    index_grupo = self.get_search(grupos_listado, persona['grupo'])
                    if index_grupo != -1:
                        grupo_id = grupos_listado_id[index_grupo]
                    
                    persona_new = {
                        "nombre": persona["nombre"],
                        "segundo_nombre": persona["segundo_nombre"],
                        "apellido": persona["apellido"],
                        "segundo_apellido": persona["segundo_apellido"],
                        "celular_whatsapp": persona["whatsapp_prefijo"],
                        "celular_llamada": persona["celular_whatsapp"],
                        "documento": persona["documento"],
                        "fechanacimiento": persona["fechanacimiento"],
                        "pais_id": persona["pais"],
                        "grupo_id": grupo_id,
                        "seccion": persona["seccion"],
                        "grupo": persona["grupo"]
                    }


                    try:
                        self.post_add_person(persona_new, user)
                        validos.append(persona_new)
                        num_validos = num_validos + 1
                    except Exception as e:
                        invalidos.append(persona_new)
                        num_invalidos = num_invalidos + 1

                data = {
                    "validos": {"count": num_validos, "data": validos},
                    "invalidos": {"count": num_invalidos, "data": invalidos},
                    "error": num_invalidos,
                }

                self.data = data
                return Response(self.response_obj)
            except Exception as e:
                self.error  = str(e)
                self.status = status.HTTP_400_BAD_REQUEST

            return Response(self.response_obj)