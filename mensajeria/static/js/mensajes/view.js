
var tokenCSRF = $('input[name="csrfmiddlewaretoken"]').val();

const boxName = "riodev";
// # Create a WebSocket in JavaScript.
const chatSocket = new WebSocket(
  "ws://" + window.location.host + "/ws/chat/" + boxName + "/"
);

chatSocket.onopen = (event) => {
  console.log("Conectado al servidor WebSocket");
  // chatSocket.send(
  //   JSON.stringify({
  //     message: message,
  //     username: user_username,
  //   })
  // );

  
};

// Evento onmessage para recibir mensajes del servidor
chatSocket.onmessage = function (event) {
  const message = JSON.parse(event.data);

  const chatContainer2 = document.getElementById("chat-container");
  const chatElements2 = [];
  chatContainer2.innerHTML = "";

  pintar(message);
  

  // console.log('Received message:', message);
  
  // const messageContent3 = document.querySelector(".message-content");
  // const chatMessage3 = document.createElement("p");
  // chatMessage3.classList.add("chat-message");
  // chatMessage3.textContent = message.message;
  // chatMessage3.id = `mensaje_${message.id}`;

  // const chatTimestamp3 = document.createElement("span");
  // chatTimestamp3.classList.add("chat-timestamp");
  // chatTimestamp3.textContent = message.timestamp_w;

  // chatMessage3.appendChild(chatTimestamp3);
  // messageContent3.appendChild(chatMessage3);
  // closeWebSocket()
  
};

// Evento onclose para detectar cuando la conexión se cierre
chatSocket.onclose = function (event) {
  console.log('WebSocket connection closed.');
};

// Evento onerror para detectar errores en la conexión
chatSocket.onerror = function (event) {
  console.error('WebSocket error:', event);
};

// Cerrar la conexión
function closeWebSocket() {
  chatSocket.close();
}

// chatSocket.onmessage = function (e) {
//    const data = JSON.parse(e.data);
//    document.querySelector('#chat-text').value += (data.message + ' sent by ' + data.username   + '\n') // add message to text box
// }

// const user_username = JSON.parse(document.getElementById('user_username').textContent);
// const user_username = "yilberth";
// // document.querySelector('#submit').onclick = function (e) {
// //  const messageInputDom = document.querySelector('#input');
// const message = "hola";

//  chatSocket.send(JSON.stringify({
//      'message': message,
//      'username': user_username,
//  }));
//  messageInputDom.value = '';
// };

// Obtener el token CSRF

// var selectDestinatarios = $("#destinatarios");

$.ajax({
  url: "get_menssage",
  type: "POST",
  data: [],
  processData: false,
  contentType: false,
  headers: {
    Authorization: tokenCSRF,
    "X-CSRFToken": tokenCSRF, // También puedes incluir el token CSRF en el encabezado X-CSRFToken
  },
  success: function (response) {
    // Obtenemos el contenedor donde deseamos agregar los elementos
    const chatContainer = document.getElementById("chat-container");
    const chatElements = [];

    response.forEach((mensaje) => {
      const chatElement = document.createElement("div");
      chatElement.classList.add("sidebar-chat");
      chatElement.style.cursor = "pointer"; // Cambiamos el cursor cuando se pase el mouse sobre el elemento
      chatElement.setAttribute("tabindex", "-1");

      chatElement.id = `chat_${mensaje.recipiente_id}`;

      chatElement.onclick = () => {
        chatElements.forEach((element) => {
          element.classList.remove("selected");
        });

        // Luego, agregamos la clase "selected" solo al elemento que se hizo clic
        chatElement.classList.add("selected");

        // // Obtener el token CSRF
        var tokenCSRF2 = $('input[name="csrfmiddlewaretoken"]').val();

        $.ajax({
          url: "get_menssage/" + mensaje.recipiente_id,
          type: "POST",
          data: [],
          processData: false,
          contentType: false,
          headers: {
            Authorization: tokenCSRF2,
            "X-CSRFToken": tokenCSRF2, // También puedes incluir el token CSRF en el encabezado X-CSRFToken
          },
          success: function (response) {
            const divMessageHeader = document.querySelector(
              ".message-header-content"
            );

            // Verificar si ya existe un elemento h4 dentro del div
            const h4Element = divMessageHeader.querySelector("h4");
            if (h4Element) {
              // Si ya existe un elemento h4, lo eliminamos
              divMessageHeader.removeChild(h4Element);
            }

            // Crear el nuevo elemento h4 y agregarle el texto "Hola"
            const newH4 = document.createElement("h4");
            newH4.textContent = mensaje.nombre;
            divMessageHeader.appendChild(newH4);

            const messageContent = document.querySelector(".message-content");
            messageContent.innerHTML = "";

            const invisibleElement = document.createElement("div");
            invisibleElement.style.display = "none"; 
            invisibleElement.id = `view_chat_${mensaje.recipiente_id}`;
            messageContent.appendChild(invisibleElement);

            response.forEach((chat) => {
              // Crear y agregar el mensaje según el estado
              if (chat.estado === "recibido") {
                // console.log('1')
                // console.log(chat)
                if(chat.mime_type == null){
                  const chatMessage = document.createElement("p");
                  chatMessage.classList.add("chat-message");
                  chatMessage.textContent = chat.texto;
                  chatMessage.id = `mensaje_${chat.mensaje_id}`;

                  const chatTimestamp = document.createElement("span");
                  chatTimestamp.classList.add("chat-timestamp");
                  chatTimestamp.textContent = chat.hora;

                  chatMessage.appendChild(chatTimestamp);
                  messageContent.appendChild(chatMessage);
                }else if(chat.mime_type == 'image/jpeg'){

                  const chatMessage = document.createElement("div");
                  chatMessage.classList.add("chat-message");
                  chatMessage.id = `mensaje_${chat.mensaje_id}`;
                  
                  const chatImage = document.createElement("img");
                  chatImage.classList.add("chat-image");
                  chatImage.style.cursor = "pointer";
                  chatImage.src = chat.link
                  
                  const chatTimestamp = document.createElement("span");
                  chatTimestamp.classList.add("chat-timestamp");
                  chatTimestamp.textContent = chat.hora;
                  
                  chatMessage.appendChild(chatImage);
                  chatMessage.appendChild(chatTimestamp);
                  messageContent.appendChild(chatMessage);
                  
                }
              } else if (chat.estado === "enviado") {
                const chatMessage = document.createElement("p");
                chatMessage.classList.add("chat-message", "chat-sent");
                chatMessage.textContent = chat.texto;
                chatMessage.id = `mensaje_${chat.mensaje_id}`;

                const chatTimestamp = document.createElement("span");
                chatTimestamp.classList.add("chat-timestamp");
                chatTimestamp.textContent = chat.hora;

                chatMessage.appendChild(chatTimestamp);
                messageContent.appendChild(chatMessage);
              }
              lastMessage = `mensaje_${chat.mensaje_id}`;
            });
            // Agrega el evento onclick a todas las imágenes dentro del contenedor de mensajes
            const chatImages = messageContent.querySelectorAll(".chat-image");
            chatImages.forEach((image) => {
              image.onclick = () => {
                mostrarVentanaEmergente(image.src);
              };
            });


            const miElemento = document.getElementById(lastMessage);

            if (miElemento) {
              miElemento.scrollIntoView({ behavior: "smooth" });
            }

            // Agregar elementos al final del mensaje
            const messageFooter = document.querySelector(".message-footer");
            messageFooter.innerHTML = ""; // Eliminar cualquier contenido existente

            const paperClipInput = document.createElement("input");
            paperClipInput.type = "file";
            paperClipInput.accept = "image/*";
            paperClipInput.id = `file_${mensaje.recipiente_id}`;
            messageFooter.appendChild(paperClipInput);

            const inputText = document.createElement("input");
            inputText.type = "text";
            inputText.placeholder = "Type a message";
            inputText.id = `txt_${mensaje.recipiente_id}`;
            messageFooter.appendChild(inputText);

            // Agregar evento para capturar la tecla "Enter"
            inputText.addEventListener("keyup", function (event) {
              // Verificar si se presionó la tecla "Enter"
              if (event.keyCode === 13) {
                // Aquí puedes ejecutar la acción que deseas realizar al presionar "Enter"
                // const mensaje = inputText.value;
                // Realizar alguna acción con el mensaje...
                sendMessage(mensaje);
                // Luego puedes borrar el contenido del input si es necesario
                inputText.value = "";
              }
            });

            const microphoneImg = document.createElement("img");
            microphoneImg.src = "/static/images/send-hor.svg";
            microphoneImg.alt = "";
            messageFooter.appendChild(microphoneImg);

            // Cambiar el cursor del mouse al pasar por encima de la imagen
            microphoneImg.style.cursor = "pointer";

            // Agregar evento onclick al elemento del micrófono
            microphoneImg.onclick = function () {
              sendMessage(mensaje);
            };
          },
          error: function (xhr, status, error) {
            alert("Error en la solicitud AJAX");
          },
        });
        // });
      };

      const chatAvatar = document.createElement("div");
      chatAvatar.classList.add("chat-avatar");
      const avatarImg = document.createElement("img");
      avatarImg.src = "/static/images/avatar.jpg";
      chatAvatar.appendChild(avatarImg);

      const chatInfo = document.createElement("div");
      chatInfo.classList.add("chat-info");
      const chatName = document.createElement("h4");
      chatName.textContent = mensaje.nombre;
      chatName.style.fontSize = "18px"; // Aumentamos el tamaño del texto del nombre
      const chatMessage = document.createElement("p");
      chatMessage.textContent = mensaje.texto;
      chatMessage.style.fontSize = "16px"; // Aumentamos el tamaño del texto del mensaje
      chatInfo.appendChild(chatName);
      chatInfo.appendChild(chatMessage);

      const timeElement = document.createElement("div");
      timeElement.classList.add("time");
      const chatTime = document.createElement("p");
      chatTime.textContent = mensaje.hora;
      chatTime.style.fontSize = "14px"; // Aumentamos el tamaño del texto de la hora
      timeElement.appendChild(chatTime);

      chatElement.appendChild(chatAvatar);
      chatElement.appendChild(chatInfo);
      chatElement.appendChild(timeElement);

      // Agregamos el elemento al contenedor
      chatElements.push(chatElement);
      chatContainer.appendChild(chatElement);
    });
  },
  error: function (xhr, status, error) {
    alert("Error en la solicitud AJAX");
  },
});

function sendMessage(mensaje) {
  txt_send = document.getElementById("txt_" + mensaje.recipiente_id).value;
  destinatario_ws = mensaje.recipiente_id;
  // console.log("texto: " + txt_send + " - destinatario_ws: " + destinatario_ws);
  var tokenCSRF2 = $('input[name="csrfmiddlewaretoken"]').val();

  $.ajax({
    url: "send_message",
    type: "POST",
    data: JSON.stringify({ destinatario: destinatario_ws, mensaje: txt_send }),
    contentType: "application/json",
    headers: {
      "X-CSRFToken": tokenCSRF2,
    },
    success: function (response) {
      const messageContent2 = document.querySelector(".message-content");

      const chatMessage2 = document.createElement("p");
      chatMessage2.classList.add("chat-message", "chat-sent");
      chatMessage2.textContent = response.message;
      chatMessage2.id = `mensaje_${response.id}`;

      const chatTimestamp2 = document.createElement("span");
      chatTimestamp2.classList.add("chat-timestamp");
      chatTimestamp2.textContent = "Enviado";

      chatMessage2.appendChild(chatTimestamp2);
      messageContent2.appendChild(chatMessage2);

      const miElemento = document.getElementById(
        "mensaje_" + response.id
      );

      if (miElemento) {
        miElemento.scrollIntoView({ behavior: "smooth" });
      }

      document.getElementById("txt_" + mensaje.recipiente_id).value = "";
      pintar(null)
    },
    error: function (xhr, status, error) {
      alert("Error en la solicitud AJAX");
    },
  });
}


function pintar(message_new)
{
  $.ajax({
    url: "get_menssage",
    type: "POST",
    data: [],
    processData: false,
    contentType: false,
    headers: {
      Authorization: tokenCSRF,
      "X-CSRFToken": tokenCSRF, // También puedes incluir el token CSRF en el encabezado X-CSRFToken
    },
    success: function (response) {
      // Obtenemos el contenedor donde deseamos agregar los elementos
      const chatContainer = document.getElementById("chat-container");
      chatContainer.innerHTML = "";
      const chatElements = [];
  
      response.forEach((mensaje) => {
        const chatElement = document.createElement("div");
        chatElement.classList.add("sidebar-chat");
        chatElement.style.cursor = "pointer"; // Cambiamos el cursor cuando se pase el mouse sobre el elemento
        chatElement.setAttribute("tabindex", "-1");
  
        chatElement.id = `chat_${mensaje.recipiente_id}`;
  
        chatElement.onclick = () => {
          chatElements.forEach((element) => {
            element.classList.remove("selected");
          });
  
          // Luego, agregamos la clase "selected" solo al elemento que se hizo clic
          chatElement.classList.add("selected");
  
          // // Obtener el token CSRF
          var tokenCSRF2 = $('input[name="csrfmiddlewaretoken"]').val();
  
          $.ajax({
            url: "get_menssage/" + mensaje.recipiente_id,
            type: "POST",
            data: [],
            processData: false,
            contentType: false,
            headers: {
              Authorization: tokenCSRF2,
              "X-CSRFToken": tokenCSRF2, // También puedes incluir el token CSRF en el encabezado X-CSRFToken
            },
            success: function (response) {
              const divMessageHeader = document.querySelector(
                ".message-header-content"
              );
  
              // Verificar si ya existe un elemento h4 dentro del div
              const h4Element = divMessageHeader.querySelector("h4");
              if (h4Element) {
                // Si ya existe un elemento h4, lo eliminamos
                divMessageHeader.removeChild(h4Element);
              }
  
              // Crear el nuevo elemento h4 y agregarle el texto "Hola"
              const newH4 = document.createElement("h4");
              newH4.textContent = mensaje.nombre;
              divMessageHeader.appendChild(newH4);
  
              const messageContent = document.querySelector(".message-content");
              messageContent.innerHTML = "";

              const invisibleElement = document.createElement("div");
              invisibleElement.style.display = "none"; 
              invisibleElement.id = `view_chat_${mensaje.recipiente_id}`;
              messageContent.appendChild(invisibleElement);
              
  
              response.forEach((chat) => {
                // Crear y agregar el mensaje según el estado
                if (chat.estado === "recibido") {
                  // console.log('2')
                  // console.log(chat)
                  if(chat.mime_type == null){
                    const chatMessage = document.createElement("p");
                    chatMessage.classList.add("chat-message");
                    chatMessage.textContent = chat.texto;
                    chatMessage.id = `mensaje_${chat.mensaje_id}`;
  
                    const chatTimestamp = document.createElement("span");
                    chatTimestamp.classList.add("chat-timestamp");
                    chatTimestamp.textContent = chat.hora;
  
                    chatMessage.appendChild(chatTimestamp);
                    messageContent.appendChild(chatMessage);
                  }else if(chat.mime_type == 'image/jpeg'){
                    // console.log('2')
                    // console.log(chat)
                    // console.log(chat.link)
                    const chatMessage = document.createElement("div");
                    chatMessage.classList.add("chat-message");
                    chatMessage.id = `mensaje_${chat.mensaje_id}`;
                    
                    const chatImage = document.createElement("img");
                    chatImage.classList.add("chat-image");
                    chatImage.style.cursor = "pointer";
                    chatImage.src = chat.link
                    
                    const chatTimestamp = document.createElement("span");
                    chatTimestamp.classList.add("chat-timestamp");
                    chatTimestamp.textContent = chat.hora;
                    
                    chatMessage.appendChild(chatImage);
                    chatMessage.appendChild(chatTimestamp);
                    messageContent.appendChild(chatMessage);
                    
                  }else{
                    console.log(chat.mime_type)
                  }
                } else if (chat.estado === "enviado") {
                  const chatMessage = document.createElement("p");
                  chatMessage.classList.add("chat-message", "chat-sent");
                  chatMessage.textContent = chat.texto;
                  chatMessage.id = `mensaje_${chat.mensaje_id}`;
  
                  const chatTimestamp = document.createElement("span");
                  chatTimestamp.classList.add("chat-timestamp");
                  chatTimestamp.textContent = chat.hora;
  
                  chatMessage.appendChild(chatTimestamp);
                  messageContent.appendChild(chatMessage);
                }
                lastMessage = `mensaje_${chat.mensaje_id}`;
              });
              // Agrega el evento onclick a todas las imágenes dentro del contenedor de mensajes
              const chatImages = messageContent.querySelectorAll(".chat-image");
              chatImages.forEach((image) => {
                image.onclick = () => {
                  mostrarVentanaEmergente(image.src);
                };
              });
  
              // const miElemento = document.getElementById(lastMessage);
  
              // if (miElemento) {
              //   miElemento.scrollIntoView({ behavior: "smooth" });
              // }
  
              // Agregar elementos al final del mensaje
              const messageFooter = document.querySelector(".message-footer");
              messageFooter.innerHTML = ""; // Eliminar cualquier contenido existente
  
              const paperClipInput = document.createElement("input");
              paperClipInput.type = "file";
              paperClipInput.accept = "image/*";
              paperClipInput.id = `file_${mensaje.recipiente_id}`;
              messageFooter.appendChild(paperClipInput);
  
              const inputText = document.createElement("input");
              inputText.type = "text";
              inputText.placeholder = "Type a message";
              inputText.id = `txt_${mensaje.recipiente_id}`;
              messageFooter.appendChild(inputText);
  
              // Agregar evento para capturar la tecla "Enter"
              inputText.addEventListener("keyup", function (event) {
                // Verificar si se presionó la tecla "Enter"
                if (event.keyCode === 13) {
                  // Aquí puedes ejecutar la acción que deseas realizar al presionar "Enter"
                  // const mensaje = inputText.value;
                  // Realizar alguna acción con el mensaje...
                  sendMessage(mensaje);
                  // Luego puedes borrar el contenido del input si es necesario
                  inputText.value = "";
                }
              });
  
              const microphoneImg = document.createElement("img");
              microphoneImg.src = "/static/images/send-hor.svg";
              microphoneImg.alt = "";
              messageFooter.appendChild(microphoneImg);
  
              // Cambiar el cursor del mouse al pasar por encima de la imagen
              microphoneImg.style.cursor = "pointer";
  
              // Agregar evento onclick al elemento del micrófono
              microphoneImg.onclick = function () {
                sendMessage(mensaje);
              };
            },
            error: function (xhr, status, error) {
              alert("Error en la solicitud AJAX");
            },
          });
          // });
        };
  
        const chatAvatar = document.createElement("div");
        chatAvatar.classList.add("chat-avatar");
        const avatarImg = document.createElement("img");
        avatarImg.src = "/static/images/avatar.jpg";
        chatAvatar.appendChild(avatarImg);
  
        const chatInfo = document.createElement("div");
        chatInfo.classList.add("chat-info");
        const chatName = document.createElement("h4");
        chatName.textContent = mensaje.nombre;
        chatName.style.fontSize = "18px"; // Aumentamos el tamaño del texto del nombre
        const chatMessage = document.createElement("p");
        chatMessage.textContent = mensaje.texto;
        chatMessage.style.fontSize = "16px"; // Aumentamos el tamaño del texto del mensaje
        chatInfo.appendChild(chatName);
        chatInfo.appendChild(chatMessage);
  
        const timeElement = document.createElement("div");
        timeElement.classList.add("time");
        const chatTime = document.createElement("p");
        chatTime.textContent = mensaje.hora;
        chatTime.style.fontSize = "14px"; // Aumentamos el tamaño del texto de la hora
        timeElement.appendChild(chatTime);
  
        chatElement.appendChild(chatAvatar);
        chatElement.appendChild(chatInfo);
        chatElement.appendChild(timeElement);
  
        // Agregamos el elemento al contenedor
        chatElements.push(chatElement);
        chatContainer.appendChild(chatElement);

        const invisibleElement = document.getElementById("view_chat_" +mensaje.recipiente_id);

        if(message_new != null){
          if (invisibleElement) {

            const messageContent3 = document.querySelector(".message-content");
              if(message_new.mime_type == ''){
                const chatMessage3 = document.createElement("p");
                chatMessage3.classList.add("chat-message");
                chatMessage3.textContent = message_new.message;
                chatMessage3.id = `mensaje_${message_new.id}`;
              
                const chatTimestamp3 = document.createElement("span");
                chatTimestamp3.classList.add("chat-timestamp");

                // Crear un objeto Date usando el timestamp
                const date = new Date(message_new.timestamp_w * 1000); // Multiplicamos por 1000 ya que el timestamp está en segundos

                // Obtener la hora y los minutos
                const horas = date.getHours();
                const minutos = date.getMinutes();
                chatTimestamp3.textContent = horas +':'+ minutos;
              
                chatMessage3.appendChild(chatTimestamp3);
                messageContent3.appendChild(chatMessage3);
              }else if(message_new.mime_type == 'image/jpeg'){
                // console.log('2')
                // console.log(chat)
                // console.log(chat.link)
                const chatMessage3 = document.createElement("div");
                chatMessage3.classList.add("chat-message");
                chatMessage3.id = `mensaje_${message_new.id}`;
                
                const chatImage3 = document.createElement("img");
                chatImage3.classList.add("chat-image");
                chatImage3.style.cursor = "pointer";
                chatImage3.src = message_new.link
                
                const chatTimestamp3= document.createElement("span");
                chatTimestamp3.classList.add("chat-timestamp");
                chatTimestamp3.textContent = message_new.hora;
                
                chatMessage3.appendChild(chatImage3);
                chatMessage3.appendChild(chatTimestamp3);
                messageContent3.appendChild(chatMessage3);
                
              }else{
                // console.log(chat.mime_type)
              }

              const chatImages = messageContent3.querySelectorAll(".chat-image");
                chatImages.forEach((image) => {
                  image.onclick = () => {
                    mostrarVentanaEmergente(image.src);
                  };
                });
            // }

            lastMessage = `mensaje_${message_new.id}`;
            const miElemento = document.getElementById(lastMessage);
    
            if (miElemento) {
              miElemento.scrollIntoView({ behavior: "smooth" });
            }else{
              // console.log(lastMessage)
            }

          } 
        }

        
      });
    },
    error: function (xhr, status, error) {
      alert("Error en la solicitud AJAX");
    },
  });
}

// Obtén la referencia del contenedor de mensajes


// Función para mostrar la ventana emergente modal
function mostrarVentanaEmergente(src) {
  const messageContent = document.querySelector(".message-content");
  // Crea el elemento de la ventana emergente
  const modal = document.createElement("div");
  modal.classList.add("modal");

  // Crea el contenido de la ventana emergente y la imagen
  const modalContent = document.createElement("div");
  modalContent.classList.add("modal-content");
  const img = document.createElement("img");
  img.src = src;
  modalContent.appendChild(img);

  // Crea el botón de cierre
  const closeBtn = document.createElement("span");
  closeBtn.classList.add("close");
  closeBtn.innerHTML = "&times;";
  closeBtn.onclick = () => {
    modal.style.display = "none";
  };
  modalContent.appendChild(closeBtn);

  // Agrega el contenido a la ventana emergente y esta al contenedor de mensajes
  modal.appendChild(modalContent);
  messageContent.appendChild(modal);

  // Muestra la ventana emergente
  modal.style.display = "block";
}


