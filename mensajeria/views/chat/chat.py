from django.db import connection
from rest_framework.generics import CreateAPIView, GenericAPIView
from ...mixins.base import ResponseMixin
from ...serializers.auth.signup_serializers import SignupSerializers
from ...serializers.auth.signin_serializers import SigninSerializers
from rest_framework.response import Response
from rest_framework import status

from mensajeria.tasks import my_task


class MenssageLeft(CreateAPIView, ResponseMixin):
    serializer_class = SignupSerializers
    

    def get(self, request, *args, **kwargs):

        filter = request.GET['filter']
        # print(filter)

        if filter != '':
            filters = " (CONCAT(p.nombre, ' ', p.segundonombre, ' ', p.apellido) LIKE %s OR p.telefonowhatsapp LIKE %s)"
            filters_values   = ['%' + filter + '%', '%' + filter + '%']
        else: 
            get_status = request.GET['list']
            filters = "  c.estado_id = %s "
            filters_values   = get_status

        # print()


        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT
                    subq.recipiente_id,
                    subq.type_message,
                    subq.texto as text_message,
                    subq.timestamp_date,
                    subq.timestamp_hour,
                    subq.name_user,
                    subq.last_name_user,
                    subq.id_message_status,
                    subq.message_status
                FROM (
                    SELECT
                        m.recipiente_id,
                        m.mime_type as type_message,
                        m.texto AS texto,
                        DATE_FORMAT(FROM_UNIXTIME(m.timestamp_w), '%%Y-%%m-%%d') AS timestamp_date,
                        DATE_FORMAT(FROM_UNIXTIME(m.timestamp_w), '%%H:%%i') AS timestamp_hour,
                        CONCAT(UPPER(LEFT(p.nombre, 1)), LCASE(SUBSTRING(p.nombre, 2))) AS name_user,
                        CONCAT(UPPER(LEFT(p.apellido, 1)), LCASE(SUBSTRING(p.apellido, 2))) AS last_name_user,
                        ROW_NUMBER() OVER (PARTITION BY m.recipiente_id ORDER BY m.timestamp_w DESC) AS row_num,
                        ma.id as id_message_status, 
                        CONCAT(UPPER(LEFT(ma.nombre, 1)), LCASE(SUBSTRING(ma.nombre, 2))) as message_status
                    FROM mensajeria m
                    INNER JOIN conversaciones c ON (m.conversacion_id = c.id)
                    INNER JOIN destinatarios d ON (m.destinatario_id = d.id)
                    INNER JOIN personas p ON (d.persona_id = p.id)
                    LEFT JOIN maestras ma on (m.estado_id = ma.id)
                    WHERE """ + filters + """
                    AND DATE_FORMAT(FROM_UNIXTIME(m.timestamp_w), '%%Y-%%m-%%d') >= CURDATE() - INTERVAL 300 DAY
                ) AS subq
                WHERE subq.row_num = 1;
            """, filters_values)

            
            rows = cursor.fetchall()

        chats = []
        for row in rows:
            
            recipiente_id       = row[0]
            type_message        = row[1]
            texto               = row[2]
            timestamp_date      = row[3]
            timestamp_hour      = row[4]
            name_user           = row[5]
            last_name_user      = row[6]
            id_message_status   = row[7]
            message_status      = row[8]

            chat = {
                'recipiente_id'     :    recipiente_id,
                'type_message'      :    type_message,
                'texto'             :    texto,
                'timestamp_date'    :    timestamp_date,
                'timestamp_hour'    :    timestamp_hour,
                'name_user'         :    name_user,
                'last_name_user'    :    last_name_user,
                'id_message_status' :    id_message_status,
                'message_status'    :    message_status,
            }
            chats.append(chat)

        data = {"chats" : chats}

        self.data = {"status": status.HTTP_200_OK, "data": data, "state": True}
        return Response(self.response_obj)
