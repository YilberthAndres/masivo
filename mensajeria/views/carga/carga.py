from cmath import nan
import re
from mensajeria.models import (
    Destinatarios,
    Personas,
    Maestras,
    Paises,
)


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


class Uploaded(CreateAPIView, ResponseMixin):
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

    def post(self, request, *args, **kwargs):
        if "archivo_excel" in request.FILES:
            archivo = request.FILES["archivo_excel"]
            if archivo.name.endswith((".xls", ".xlsx")):
                # try:
                df = pd.read_excel(archivo, engine="openpyxl")
                matriz = df.values.tolist()

                errados = []
                validos = []
                validos_celular = []
                duplicados = []
                duplicados_docu = []

                num_validos = 0
                num_duplicados = 0
                num_errados = 0

                personas_actuales = Personas.objects.all().order_by("telefonowhatsapp")
                paises_actuales = Paises.objects.all()

                paises_validos = []
                paises_codigo = []

                for pais in paises_actuales:
                    paises_validos.append(pais.nombre)
                    paises_codigo.append(pais.codigo)

                validos_actuales = []
                documentos_actuales = []
                for persona in personas_actuales:
                    validos_actuales.append(persona.telefonowhatsapp)
                    documentos_actuales.append(persona.identificacion)

                matriz_data = self.get_validar_campos(matriz)
                for row in matriz_data:
                    nombre = row[0]
                    segundo_nombre = row[1]
                    apellido = row[2]
                    segundo_apellido = row[3]
                    celular = row[4]
                    celular_llamada = row[5]
                    pais = row[6]
                    documento = row[7]
                    tipoidentificacion = row[8]
                    lugarexpedicion = row[9]
                    fechaexpedicion = row[10]
                    fechanacimiento = row[11]
                    direccion = row[12]
                    email = row[13]
                    sexo_id = row[14]
                    barrio = row[15]
                    ciudad = row[16]
                    departamento = row[17]
                    ocupacion = row[18]

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

                    try:
                        fechaexpedicion = datetime.strptime(
                            fechaexpedicion, "%Y-%m-%d %H:%M:%S"
                        ).date()
                        if fechaexpedicion > datetime.now().date():
                            fechaexpedicion = ""
                    except ValueError:
                        fechaexpedicion = ""

                    try:
                        fechanacimiento = datetime.strptime(
                            fechanacimiento, "%Y-%m-%d %H:%M:%S"
                        ).date()
                        if fechanacimiento > datetime.now().date():
                            fechanacimiento = ""
                    except ValueError:
                        fechanacimiento = ""

                    try:
                        validate_email(email)
                    except ValidationError as e:
                        email = ""

                    if not isinstance(celular, str):
                        celular = str(celular)

                    if not isinstance(celular_llamada, str):
                        celular_llamada = str(celular_llamada).rstrip(".0")

                    documento = str(documento).rstrip(".0")

                    persona_new = {
                        "nombre": nombre,
                        "segundo_nombre": segundo_nombre,
                        "apellido": apellido,
                        "segundo_apellido": segundo_apellido,
                        "celular_whatsapp": celular,
                        "whatsapp_prefijo": codigo + celular,
                        "celular_llamada": celular_llamada,
                        "pais": pais_id,
                        "documento": documento,
                        "tipoidentificacion": tipoidentificacion,
                        "lugarexpedicion": lugarexpedicion,
                        "fechaexpedicion": fechaexpedicion,
                        "fechanacimiento": fechanacimiento,
                        "direccion": direccion,
                        "email": email,
                        "sexo_id": sexo_id,
                        "barrio": barrio,
                        "ciudad": ciudad,
                        "departamento": departamento,
                        "ocupacion": ocupacion,
                        "message": "",
                    }

                    if not self.get_validar_numero(persona_new["celular_whatsapp"]):
                        persona_new["message"] = "Numero de whatsapp invalido."
                        errados.append(persona_new)
                        num_errados = num_errados + 1
                    else:
                        validos_celular.sort()
                        index = self.get_binary_search(validos_celular, celular)

                        if index != -1:
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

                # result = my_task.delay(duplicados)
                # result_value = result.get()
                # print("Tarea")
                # result = my_task.get()

                self.data = {"status": status.HTTP_200_OK, "data": data, "state": True}
            # except Exception as e:
            #     self.data = {"status": status.HTTP_400_BAD_REQUEST, "data": "Error", "state": False}

        else:
            self.data = {
                "status": status.HTTP_400_BAD_REQUEST,
                "data": "Error",
                "state": False,
            }
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
            direccion=data["direccion"],
            fechanacimiento=data["fechanacimiento"],
            barrio=data["barrio"],
            sexo_id=data["sexo_id"],
            pais_id=data["pais_id"],
            created_by=user,
        )

        nueva_persona.save()
        persona_id = nueva_persona.id

        nuevo_registro = Destinatarios(
            persona_id=persona_id, created_by=user, estado_id=596
        )
        nuevo_registro.save()

        return True

    def post(self, request, *args, **kwargs):
        personas = request.data["destinatarios"]

        # print(personas)
        user = request.user
        validos = []
        num_validos = 0
        invalidos = []
        num_invalidos = 0

        for persona in personas:
            sexo_id = 21

            if persona["sexo_id"] == "M":
                sexo_id = 21
            else:
                sexo_id = 22
            persona_new = {
                "nombre": persona["nombre"],
                "segundo_nombre": persona["segundo_nombre"],
                "apellido": persona["apellido"],
                "segundo_apellido": persona["segundo_apellido"],
                "celular_whatsapp": persona["whatsapp_prefijo"],
                "celular_llamada": persona["celular_llamada"],
                "documento": persona["documento"],
                "direccion": persona["direccion"],
                "email": persona["email"],
                "fechanacimiento": persona["fechanacimiento"],
                "barrio": persona["barrio"],
                "sexo_id": sexo_id,
                "pais_id": persona["pais"],
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

        self.data = {"status": status.HTTP_200_OK, "data": data, "state": True}
        return Response(self.response_obj)


class DestinatarioCreate(CreateAPIView, ResponseMixin):
    def get(self, request, *args, **kwargs):
        try:
            tipo_documentos = Maestras.objects.filter(padre_id=8)
            tipo_sexos = Maestras.objects.filter(padre_id=20)
            paises_actuales = Paises.objects.all()

            list_paises = []
            for pais in paises_actuales:
                list_paises.append(
                    {
                        "id": pais.id,
                        "nombre": pais.nombre,
                        "codigo": pais.codigo,
                    }
                )
            list_documentos = []
            for documento in tipo_documentos:
                list_documentos.append(
                    {
                        "id": documento.id,
                        "nombre": documento.nombre,
                    }
                )

            list_sexos = []
            for sexo in tipo_sexos:
                list_sexos.append(
                    {
                        "id": sexo.id,
                        "nombre": sexo.nombre,
                    }
                )

            self.data = {
                "tipos_documentos": list_documentos,
                "tipos_sexos": list_sexos,
                "tipos_paises": list_paises,
            }

            return Response(self.response_obj)
        except Exception as e:
            self.error = e.args
            self.status = status.HTTP_400_BAD_REQUEST
            return Response(self.response_obj)
