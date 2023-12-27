from cmath import nan
import re
from types import NoneType
from django.shortcuts import render, redirect
from django.http import JsonResponse
from mensajeria.models import (
    Archivos,
    Destinatarios,
    Personas,
    Grupos,
    Destinatariosgrupos,
    Paises,
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


class PreparationGrupo(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers

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

    def get_validar_campos(self, matriz):
        return [
            [str(x) if x is not None and not pd.isna(x) else "" for x in row]
            for row in matriz
        ]
    
    def post(self, request, *args, **kwargs):

        try: 

            if "archivo_excel_area" in request.FILES:
                archivo = request.FILES["archivo_excel_area"]
                if archivo.name.endswith((".xls", ".xlsx")):

                    grupo_id = 46
                    df = pd.read_excel(archivo, engine="openpyxl")
                    matriz = df.values.tolist()

                    matriz_data = self.get_validar_campos(matriz)
                    personas_list = Personas.objects.all().values('telefonomovil').order_by('telefonomovil')
                    user = request.user

                    errados     = []
                    agregados   = []
                    duplicados  = []
                    duplicados_excel = []

                    paises_actuales = Paises.objects.all()

                    paises_validos = []
                    paises_codigo = []

                    for pais in paises_actuales:
                        paises_validos.append(pais.nombre)
                        paises_codigo.append(pais.codigo)

                    personas_actuales = []
                    for persona_data in personas_list:
                        personas_actuales.append(persona_data['telefonomovil'])

                    grupo = Grupos.objects.get(id=grupo_id)

                    if(grupo.estado_id == 596):



                        telefonos_moviles = Personas.objects.filter(
                            Personas_destinatarios_persona__destinatariosGrupos_destinatarios__grupo_id=46
                        ).order_by("telefonomovil")
                        telefonos_moviles = [persona.telefonomovil for persona in telefonos_moviles]

                        for row in matriz_data:
                            persona_index = self.get_binary_search(personas_actuales, row[0])
                            
                            if persona_index != -1:

                                index = self.get_binary_search(telefonos_moviles, row[0])

                                if index == -1:
                                    print(row[0])
                                    excel_index = self.get_binary_search(duplicados_excel, row[0])
                                    
                                    if excel_index == -1:
                                        pais = row[1]

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
                                        persona = Personas.objects.filter(telefonomovil=row[0]).first()
                                        if persona:
                                            destinatario = Destinatarios.objects.filter(persona_id = persona.id)
                                            destinatario_id = destinatario[0].id
                                        else:
                                            new_persona = Personas()
                                            new_persona.nombre = ''
                                            new_persona.apellido = ''
                                            new_persona.telefonomovil = row[0]
                                            new_persona.pais_id = pais_id
                                            new_persona.telefonowhatsapp = codigo + row[0]
                                            new_persona.created_by = user

                                            new_persona.save()
                                            new_persona_id = new_persona.id

                                            destinatario = Destinatarios
                                            destinatario.persona_id = new_persona_id
                                            destinatario.created_by = user
                                            destinatario.save()
                                            destinatario_id = destinatario.id

                                        new_destinatarioGrupo = Destinatariosgrupos()
                                        new_destinatarioGrupo.grupo_id        = grupo.id
                                        new_destinatarioGrupo.destinatario_id = destinatario_id
                                        new_destinatarioGrupo.created_by = user
                                        new_destinatarioGrupo.save()

                                        agregados.append(row)
                                        duplicados_excel.append(row[0])
                                    else:
                                        duplicados.append(row)
                                else:
                                    duplicados.append(row)
                            else:
                                errados.append(row)
                        
                        data = {
                            "agregados": agregados,
                            "errados": errados,
                            "duplicados": duplicados,
                        }
                            
                        self.data   = data
                    else:
                        self.error  = "El grupo no esta activo."
                        self.status = status.HTTP_400_BAD_REQUEST

                    return Response(self.response_obj)      
            else:
                self.error  = "Archivo no encontrado"
                self.status = status.HTTP_400_BAD_REQUEST

        except Exception as e:
            self.error  = str(e)
            self.status = status.HTTP_400_BAD_REQUEST

        return Response(self.response_obj)
    