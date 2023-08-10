import json
from channels.generic.websocket import AsyncWebsocketConsumer

class ChatRoomConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.chat_box_name = self.scope["url_route"]["kwargs"]["chat_box_name"]
        self.group_name = "chat_%s" % self.chat_box_name
        # self.group_name = "chat_mordecay"

        await self.channel_layer.group_add(self.group_name, self.channel_name)

        await self.accept()

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
    # Receive message from room group.
    async def chatbox_message(self, event):
        id              =   event["id"]
        message         =   event["message"]
        timestamp_w     =   event["timestamp_w"]
        recipiente_id   =   event["recipiente_id"]
        mime_type       =   event["mime_type"]
        link            =   event["link"]
        filename        =   event["filename"]
        voice           =   event["voice"]
        
        #send message and username of sender to websocket
        
        await self.send(
            text_data=json.dumps(
                {
                    "id"            :   id,
                    "texto"         :   message,
                    "hora"          :   timestamp_w,
                    "recipiente_id" :   recipiente_id,
                    "mime_type"     :   mime_type,
                    "dir"           :   link,
                    "filename"      :   filename,
                    "voice"         :   voice,
                }
            )
        )
    
    def send_notification(self, event):
        # Esta función enviará la notificación al cliente
        notification = event['notification']
        self.send(text_data=json.dumps(notification))