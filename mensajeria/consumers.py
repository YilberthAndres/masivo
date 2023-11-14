import json
from channels.generic.websocket import AsyncWebsocketConsumer
from django.db import connection
from channels.db import database_sync_to_async


class ChatRoomConsumer(AsyncWebsocketConsumer):
    @database_sync_to_async
    def get_data(self):
        cursor = connection.cursor()
        cursor.execute(
            """
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
                                DATE_FORMAT(FROM_UNIXTIME(m.timestamp_w), '%Y-%m-%d') AS timestamp_date,
                                DATE_FORMAT(FROM_UNIXTIME(m.timestamp_w), '%H:%i') AS timestamp_hour,
                                CONCAT(UPPER(LEFT(p.nombre, 1)), LCASE(SUBSTRING(p.nombre, 2))) AS name_user,
                                CONCAT(UPPER(LEFT(p.apellido, 1)), LCASE(SUBSTRING(p.apellido, 2))) AS last_name_user,
                                ROW_NUMBER() OVER (PARTITION BY m.recipiente_id ORDER BY m.timestamp_w DESC) AS row_num,
                                ma.id as id_message_status,
                                CONCAT(UPPER(LEFT(ma.nombre, 1)), LCASE(SUBSTRING(ma.nombre, 2))) as message_status
                            FROM mensajeria m
                            INNER JOIN conversaciones c ON (m.conversacion_id = c.id)
                            INNER JOIN destinatarios d ON (c.destinatario_id = d.id)
                            INNER JOIN personas p ON (d.persona_id = p.id)
                            LEFT JOIN maestras ma on (m.estado_id = ma.id)
                            WHERE c.estado_id = 758
                            AND DATE_FORMAT(FROM_UNIXTIME(m.timestamp_w), '%Y-%m-%d') >= CURDATE() - INTERVAL 300 DAY
                        ) AS subq
                        WHERE subq.row_num = 1;
                    """
        )
        rows = cursor.fetchall()

        chats = []
        for row in rows:
            recipiente_id = row[0]
            type_message = row[1]
            texto = row[2]
            timestamp_date = row[3]
            timestamp_hour = row[4]
            name_user = row[5]
            last_name_user = row[6]
            id_message_status = row[7]
            message_status = row[8]

            chat = {
                "recipiente_id": recipiente_id,
                "type_message": type_message,
                "texto": texto,
                "timestamp_date": timestamp_date,
                "timestamp_hour": timestamp_hour,
                "name_user": name_user,
                "last_name_user": last_name_user,
                "id_message_status": id_message_status,
                "message_status": message_status,
            }
            chats.append(chat)

        return chats

    async def connect(self):
        self.chat_box_name = self.scope["url_route"]["kwargs"]["chat_box_name"]
        self.group_name = "chat_%s" % self.chat_box_name
        # self.group_name = "chat_mordecay"

        await self.channel_layer.group_add(self.group_name, self.channel_name)

        await self.accept()
        await self.chats_menu()

    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(self.group_name, self.channel_name)

    # This function receive messages from WebSocket.
    async def receive(self, text_data):
        text_data_json = json.loads(text_data)
        message = text_data_json["message"]
        username = text_data_json["username"]

        await self.channel_layer.group_send(
            self.group_name,
            {
                "type": "chatbox_message",
                "message": message,
                "username": username,
            },
        )

    async def chats_menu(self):
        chats = await self.get_data()
        await self.send(text_data=json.dumps(chats))

    # Receive message from room group.
    async def chatbox_message(self, event):
        message = event["message"]
        chats = await self.get_data()

        message_body = {"message": {**message}, "chats": chats}

        # send message and username of sender to websocket

        await self.send(text_data=json.dumps(message_body))

    def send_notification(self, event):
        # Esta función enviará la notificación al cliente
        notification = event["notification"]
        self.send(text_data=json.dumps(notification))
