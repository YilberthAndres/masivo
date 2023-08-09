var tokenCSRF = $('input[name="csrfmiddlewaretoken"]').val();
const chat_activos = 758
const chat_archviados = 759
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
  console.log(message)
  pintar(message, '', chat_activos);
};

// Evento onclose para detectar cuando la conexión se cierre
chatSocket.onclose = function (event) {
  console.log("WebSocket connection closed.");
};

// Evento onerror para detectar errores en la conexión
chatSocket.onerror = function (event) {
  console.error("WebSocket error:", event);
};

// Cerrar la conexión
function closeWebSocket() {
  chatSocket.close();
}

 // Variable para almacenar el reproductor de audio actual
 let currentAudioPlayer = null;

 // Función para detener el reproductor de audio actual
 function stopCurrentAudioPlayer() {
   if (currentAudioPlayer) {
     currentAudioPlayer.pause();
     currentAudioPlayer.currentTime = 0;
   }
 }

 // Función para iniciar un nuevo reproductor de audio
 function startNewAudioPlayer(audioPlayer) {
   stopCurrentAudioPlayer();
   currentAudioPlayer = audioPlayer;
   audioPlayer.play();
 }


function sendMessage(mensaje) {
  txt_send = document.getElementById("txt_" + mensaje.recipiente_id).value;
  destinatario_ws = mensaje.recipiente_id;
  
  var tokenCSRF2 = $('input[name="csrfmiddlewaretoken"]').val();

  $.ajax({
    url: "send_message",
    type: "POST",
    data: JSON.stringify({ destinatario: destinatario_ws, mensaje: txt_send,tipo: 'txt' }),
    contentType: "application/json",
    headers: {
      "X-CSRFToken": tokenCSRF2,
    },
    success: function (response) {
      mensaje_texto(response, 'enviado' );
      const miElemento = document.getElementById("mensaje_" + response.id);
      if (miElemento) {
        miElemento.scrollIntoView({ behavior: "smooth" });
      }
      document.getElementById("txt_" + mensaje.recipiente_id).value = "";
      pintar(null, '', chat_activos);
    },
    error: function (xhr, status, error) {
      alert("Error en la solicitud AJAX");
    },
  });
}





function pintar(message_new, filtro, estado) {
  $.ajax({
    url: "get_menssage?filtro=" + filtro + "&estado=" + estado,
    type: "POST",
    data: [],
    processData: false,
    contentType: false,
    headers: {
      Authorization: tokenCSRF,
      "X-CSRFToken": tokenCSRF, // También puedes incluir el token CSRF en el encabezado X-CSRFToken
    },
    success: function (response) {
      list_menssage_find(response, message_new) 
    },
    error: function (xhr, status, error) {
      alert("Error en la solicitud AJAX");
    },
  });
}

// Listado de mensajes Lateral

function list_menssage_find(response, message_new) 
{
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

        let isMouseDown = false;
        let isClickCancelled = false;

        // Agregar evento mousedown
        chatElement.addEventListener("mousedown", function (event) {
          isMouseDown = true;
          // console.log('precionando: '
          console.log(mensaje)
          setTimeout(function () {
            if (isMouseDown) {
              marcar_charArchivado(mensaje.recipiente_id, mensaje.nombre, mensaje.estado_id);
            }
          }, 500); 
        });

        // Agregar evento mouseup
        chatElement.addEventListener("mouseup", function (event) {
          isMouseDown = false;
          // console.log("Evento 'mouseup' activado (se soltó el clic).");
          // Aquí puedes ejecutar la lógica que deseas realizar al soltar el clic
          if (isClickCancelled) {
            isClickCancelled = false;
            event.stopPropagation();
          }
        });


        chatElement.addEventListener("click", function (event) {
          if (!isMouseDown) 
          {
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
                // Agregar el evento onclick al elemento
                messageContent.addEventListener("click", function () {
                  // Código que se ejecutará cuando se haga clic en el elemento
                  marcar_leidos(mensaje.recipiente_id, tokenCSRF2);
                });
                messageContent.innerHTML = "";

                const invisibleElement = document.createElement("div");
                invisibleElement.style.display = "none";
                invisibleElement.id = `view_chat_${mensaje.recipiente_id}`;
                messageContent.appendChild(invisibleElement);

                const inputElement = document.createElement("input");
                inputElement.type = "hidden";
                inputElement.id = "chat_actual";
                // inputElement.style.display = "none"; // Hacer el input invisible
                inputElement.value = mensaje.recipiente_id; 
                messageContent.appendChild(inputElement);


                response.forEach((chat) => {
                  // Crear y agregar el mensaje según el estado
                  if (chat.estado === "recibido") {

                    if (chat.mime_type == null) {
                      mensaje_texto(chat, chat.estado );
                    } else if (chat.mime_type == "image/jpeg") {
                      mensaje_img(chat, chat.estado)
                    } else if (chat.mime_type == "video/mp4") {
                      mensaje_video(chat, chat.estado)
                    } else if (chat.filename != null) {
                      mensaje_file(chat, chat.estado)
                    }  else if (chat.voice != '') {
                      
                      const chatMessage = document.createElement("div");
                      chatMessage.classList.add("chat-message");
                      chatMessage.id = `mensaje_${chat.id}`;

                      if (chat.voice === "True") {
                        // Agregar el avatar
                        const avatarAudioContainer = document.createElement("div");
                        avatarAudioContainer.classList.add("avatar-audio-container");
                    
                        // Agregar el avatar al contenedor
                        const chatAvatar = document.createElement("div");
                        chatAvatar.classList.add("chat-avatar");
                        const avatarImg = document.createElement("img");
                        avatarImg.src = "/static/images/avatar.jpg";
                        chatAvatar.appendChild(avatarImg);
                        avatarAudioContainer.appendChild(chatAvatar);
                    
                        // Agregar el reproductor de audio al contenedor
                        const audioPlayer = document.createElement("audio");
                        audioPlayer.controls = true;
                        audioPlayer.classList.add("chat-audio"); // Aplicar la clase de estilo para el reproductor de audio
                        audioPlayer.src = chat.link; // Asumiendo que la propiedad chat.link contiene la URL del archivo de audio
                        audioPlayer.addEventListener("play", () => startNewAudioPlayer(audioPlayer));
                        avatarAudioContainer.appendChild(audioPlayer);
                    
                        // Agregar el contenedor al chatMessage
                        chatMessage.appendChild(avatarAudioContainer);
                      } else {
                        // console.log(chat.voice)
                        // Agregar el reproductor de audio
                        // Agregar solo el reproductor de audio
                        const audioPlayer = document.createElement("audio");
                        audioPlayer.controls = true;
                        audioPlayer.classList.add("chat-audio"); // Aplicar la clase de estilo para el reproductor de audio
                        audioPlayer.src = chat.link; // Asumiendo que la propiedad chat.link contiene la URL del archivo de audio
                        audioPlayer.addEventListener("play", () => startNewAudioPlayer(audioPlayer));
                        chatMessage.appendChild(audioPlayer);
                      }

                      // Agregar el mensaje y la hora
                      const chatInfo = document.createElement("div");
                      chatInfo.classList.add("chat-info");
                      const chatName = document.createElement("h4");
                      chatName.textContent = chat.nombre;
                      chatName.style.fontSize = "18px";
                      const chatTimestamp = document.createElement("span");
                      chatTimestamp.classList.add("chat-timestamp");
                      chatTimestamp.textContent = chat.hora;
                      chatInfo.appendChild(chatName);
                      chatInfo.appendChild(chatTimestamp);

                      chatMessage.appendChild(chatInfo);
                      messageContent.appendChild(chatMessage);


                    } 

                  } else if (chat.estado === "enviado") {

                    if(chat.mime_type == null){
                      mensaje_texto(chat, chat.estado );

                    }else if (chat.mime_type == "image/jpeg") {
                      
                      mensaje_img(chat, chat.estado)
                    }
                    



                  }
                  lastMessage = `mensaje_${chat.id}`;
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

                // const paperClipInput = document.createElement("input");
                // paperClipInput.type = "file";
                // paperClipInput.accept = "image/*";

                // paperClipInput.id = `file_${mensaje.recipiente_id}`;
                // messageFooter.appendChild(paperClipInput);
                // Crea un botón estilizado
                const adjuntarButton = document.createElement("button");
                adjuntarButton.textContent = "Adjuntar archivo";
                adjuntarButton.style.padding = "10px 20px";
                adjuntarButton.style.backgroundColor = "#007bff";
                adjuntarButton.style.color = "#fff";
                adjuntarButton.style.border = "none";
                adjuntarButton.style.borderRadius = "5px";
                adjuntarButton.style.cursor = "pointer";
                adjuntarButton.style.marginRight = "10px";

                // Agrega un evento clic al botón para abrir la ventana de selección de archivos
                adjuntarButton.addEventListener("click", function () {
                  const inputElement = document.createElement("input");
                  inputElement.type = "file";
                  inputElement.accept = "image/*, video/*, audio/*, .doc, .docx, .xls, .xlsx, .txt";
                  inputElement.multiple = true;
                  inputElement.style.display = "none";

                  // Agrega un evento cambio al elemento <input> para manejar la selección de archivos
                  // inputElement.addEventListener("change", handleFileSelection.bind(null, mensaje.recipiente_id));
                  inputElement.addEventListener("change", handleFileSelection);

                  // Simula un clic en el elemento <input> para abrir el explorador de archivos
                  inputElement.click();
                });

                // Agrega el botón al messageFooter o cualquier otro contenedor donde desees mostrarlo
                messageFooter.appendChild(adjuntarButton);


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

            marcar_leidos(mensaje.recipiente_id, tokenCSRF2);
          }else {
            // console.log("Evento 'click' cancelado (se mantuvo presionado).");
            // Si se ha mantenido presionado el elemento, cancelamos el evento click
            isClickCancelled = true;
          }
      })

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
        if (mensaje.sin_leer != "0" && mensaje.sin_leer != null) {
          const numberElement = document.createElement("div");
          numberElement.classList.add("number");
          numberElement.textContent = mensaje.sin_leer; // Aquí debes colocar el número que desees mostrar
          numberElement.id = `sin_leer_${mensaje.recipiente_id}`; // Aquí debes colocar el número que desees mostrar

          timeElement.appendChild(chatTime);
          timeElement.appendChild(numberElement);
        } else {
          timeElement.appendChild(chatTime);
        }

        chatElement.appendChild(chatAvatar);
        chatElement.appendChild(chatInfo);
        chatElement.appendChild(timeElement);

        // Agregamos el elemento al contenedor
        chatElements.push(chatElement);
        chatContainer.appendChild(chatElement);

        const invisibleElement = document.getElementById(
          "view_chat_" + mensaje.recipiente_id
        );

        if (message_new != null) {
          if (invisibleElement) {
            const messageContent3 = document.querySelector(".message-content");
            if (message_new.mime_type == "") {
              mensaje_texto(message_new, 'recibido' );
            } else if (message_new.mime_type == "image/jpeg") {
              mensaje_img(message_new, 'recibido' );
            } else if (message_new.mime_type == "video/mp4") {
              mensaje_video(message_new, 'recibido' );
            } else if (message_new.filename != '') {
              mensaje_file(message_new, 'recibido' );
            } else if (message_new.voice !== '') {
              console.log('Dentro audio')
                    
              const chatMessage3 = document.createElement("div");
              chatMessage3.classList.add("chat-message");
              chatMessage3.id = `mensaje_${message_new.id}`;

              if (message_new.voice === true) {
                // Agregar el avatar
                const avatarAudioContainer3 = document.createElement("div");
                avatarAudioContainer3.classList.add("avatar-audio-container");
            
                // Agregar el avatar al contenedor
                const chatAvatar3 = document.createElement("div");
                chatAvatar3.classList.add("chat-avatar");
                const avatarImg3  = document.createElement("img");
                avatarImg3.src    = "/static/images/avatar.jpg";
                chatAvatar3.appendChild(avatarImg3);
                avatarAudioContainer3.appendChild(chatAvatar3);
            
                // Agregar el reproductor de audio al contenedor
                const audioPlayer3 = document.createElement("audio");
                audioPlayer3.controls = true;
                audioPlayer3.classList.add("chat-audio"); // Aplicar la clase de estilo para el reproductor de audio
                audioPlayer3.src = message_new.link; // Asumiendo que la propiedad message_new.link contiene la URL del archivo de audio
                audioPlayer3.addEventListener("play", () => startNewAudioPlayer(audioPlayer3));
                avatarAudioContainer3.appendChild(audioPlayer3);
            
                // Agregar el contenedor al chatMessage
                chatMessage3.appendChild(avatarAudioContainer3);
              } else {
                // console.log(message_new.voice)
                // Agregar el reproductor de audio
                 // Agregar solo el reproductor de audio
                const audioPlayer3 = document.createElement("audio");
                audioPlayer3.controls = true;
                audioPlayer3.classList.add("chat-audio"); // Aplicar la clase de estilo para el reproductor de audio
                audioPlayer3.src = message_new.link; // Asumiendo que la propiedad message_new.link contiene la URL del archivo de audio
                audioPlayer3.addEventListener("play", () => startNewAudioPlayer(audioPlayer3));
                chatMessage3.appendChild(audioPlayer3);
              }

              // Agregar el mensaje y la hora
              const chatInfo3 = document.createElement("div");
              chatInfo3.classList.add("chat-info");
              const chatName3 = document.createElement("h4");
              chatName3.textContent = message_new.nombre;
              chatName3.style.fontSize = "18px";
              const chatTimestamp3 = document.createElement("span");
              chatTimestamp3.classList.add("chat-timestamp");
              chatTimestamp3.textContent = message_new.hora;
              chatInfo3.appendChild(chatName3);
              chatInfo3.appendChild(chatTimestamp3);

              chatMessage3.appendChild(chatInfo3);
              messageContent3.appendChild(chatMessage3);


            } else{
              console.log("Audio fuera");
              console.log(message_new.voice);
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
            } 
          }
        }
      });
}

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

function marcar_leidos(recipiente_id, tokenCSRF2) {
  const numeroElement = document.getElementById("sin_leer_" + recipiente_id);
  if (numeroElement) {
    numeroElement.remove();

    $.ajax({
      url: "messages_read/" + recipiente_id,
      type: "POST",
      data: [],
      processData: false,
      contentType: false,
      headers: {
        Authorization: tokenCSRF2,
        "X-CSRFToken": tokenCSRF2, // También puedes incluir el token CSRF en el encabezado X-CSRFToken
      },
      success: function (response) {
        
      },
      error: function (xhr, status, error) {
        alert("Error en la solicitud AJAX");
      },
    });
  }
}

function esImagen(file) {
  // Obtenemos el tipo MIME del archivo
  const mimeType = file.type;

  // Verificamos si el tipo MIME corresponde a una imagen
  return mimeType.startsWith("image/");
}

function esVideo(mime_type) {
  // Array con los tipos MIME de video que quieres aceptar
  const tiposMIMEVideo = ["video/mp4", "video/mpeg", "video/ogg", "video/webm"];

  // Verificamos si el tipo MIME del archivo está presente en el array de tipos de video
  return tiposMIMEVideo.includes(mime_type);
}

function esAudio(mime_type) {
  // Array con los tipos MIME de audio que quieres aceptar
  const tiposMIMEAudio = ["audio/mpeg", "audio/ogg", "audio/wav", "audio/webm"];

  // Verificamos si el tipo MIME del archivo está presente en el array de tipos de audio
  return tiposMIMEAudio.includes(mime_type);
}



function esPDF(url) {
  // Verificar si el enlace termina con ".pdf" (ignorando mayúsculas y minúsculas)
  return url.toLowerCase().endsWith(".pdf");
}

function esWord(url) {
  if (typeof url === "string") {
    // Verificar si el enlace termina con una extensión de Word (.doc, .docx, .rtf)
    const wordExtensions = [".doc", ".docx", ".rtf"];
    const lowerCaseUrl = url.toLowerCase();
    return wordExtensions.some(extension => lowerCaseUrl.endsWith(extension));
  }
  return false;
}

function esExcel(url) {
  if (typeof url === "string") {
    // Verificar si el enlace termina con una extensión de Excel (.xls, .xlsx, .csv)
    const excelExtensions = [".xls", ".xlsx", ".csv"];
    const lowerCaseUrl = url.toLowerCase();
    return excelExtensions.some(extension => lowerCaseUrl.endsWith(extension));
  }
  return false;
}


// Función para manejar la selección de archivos
function handleFileSelection(event) {
  const archivosSeleccionados = Array.from(event.target.files);

  // Ejemplo: Mostrar el nombre de cada archivo seleccionado
  for (const archivo of archivosSeleccionados) {
    console.log('Nombre:', archivo.name);
    if (esImagenArchivo(archivo)) {

      sendMessageMultimedia(archivo, 'image')

    }else if (esVideoArchivo(archivo)) {
      console.log('Tipo: Video');
    }else if (esAudioArchivo(archivo)) {
      console.log('Tipo: Audio');
    }else if (esArchivoArchivo(archivo)) {
      console.log('Tipo: Documento');
    }else{
      console.log('Archivo no valido');
    }
  }
}

//ENVIAR MULTIMEDIA
function sendMessageMultimedia(file, tipo) {
  var tokenCSRF2 = $('input[name="csrfmiddlewaretoken"]').val();
  var destinatario_ws = document.getElementById("chat_actual").value;

  // Crear un objeto FormData y agregar el archivo seleccionado
  var formData = new FormData();
  formData.append('destinatario', destinatario_ws);
  formData.append('tipo', tipo);
  formData.append('archivo', file);

  $.ajax({
    url: "send_message_media",
    type: "POST",
    data: formData,
    headers: {
      "X-CSRFToken": tokenCSRF2,
    },
    processData: false, // Para evitar que jQuery procese el FormData
    contentType: false, // Para que jQuery establezca automáticamente el encabezado correcto
    success: function (response) {
      // console.log(response);

      if (response.img.mime_type == 'image/jpeg') {
        mensaje_img(response.img, 'enviado' );
        const miElemento = document.getElementById("mensaje_" + response.img.id);

        if (miElemento) {
          miElemento.scrollIntoView({ behavior: "smooth" });
        }

        document.getElementById("txt_" + mensaje.recipiente_id).value = "";
        pintar(null, '', chat_activos);
      }
    },
    error: function (xhr, status, error) {
      alert("Error en la solicitud AJAX");
    },
  });
}


// Función para verificar si el archivo es una imagen
function esImagenArchivo(archivo) {
  return archivo.type.startsWith('image/');
}

// Función para verificar si el archivo es un video
function esVideoArchivo(archivo) {
  return archivo.type.startsWith('video/');
}

// Función para verificar si el archivo es un archivo de Word, Excel o TXT
function esArchivoArchivo(archivo) {
  return (
    archivo.type === 'application/msword' ||
    archivo.type === 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ||
    archivo.type === 'application/vnd.ms-excel' ||
    archivo.type === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ||
    archivo.type === 'text/plain'
  );
}

// Función para verificar si el archivo es un audio
function esAudioArchivo(archivo) {
  return archivo.type.startsWith('audio/');
}




function sendImg(file) {
  txt_send = document.getElementById("txt_" + mensaje.recipiente_id).value;
  destinatario_ws = mensaje.recipiente_id;
  
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
      
      const messageContent = document.querySelector(".message-content");
      const chatMessage = document.createElement("div");
      chatMessage.classList.add("chat-message", "chat-sent");
      chatMessage.id = `mensaje_${response.img.id}`;

      const chatImage = document.createElement("img");
      chatImage.classList.add("chat-image");
      chatImage.style.cursor = "pointer";
      chatImage.src = response.img.link;

      const chatTimestamp = document.createElement("span");
      chatTimestamp.classList.add("chat-timestamp");
      chatTimestamp.textContent = 'enviado';

      chatMessage.appendChild(chatImage);
      chatMessage.appendChild(chatTimestamp);
      messageContent.appendChild(chatMessage);

      const miElemento = document.getElementById("mensaje_" + response.img.id);

      if (miElemento) {
        miElemento.scrollIntoView({ behavior: "smooth" });
      }

      document.getElementById("txt_" + mensaje.recipiente_id).value = "";
      pintar(null, '', chat_activos);
    },
    error: function (xhr, status, error) {
      alert("Error en la solicitud AJAX");
    },
  });
}

const searchContainer = document.getElementById("sidebar-search-container");
const searchInput = document.getElementById("search-input");

searchContainer.addEventListener("click", () => {
  // Al dar clic en cualquier parte del contenedor,
  // enfocamos el input para permitir escribir en él.
  searchInput.focus();
});

searchInput.addEventListener("input", (event) => {
  // Capturamos el texto que se va escribiendo en el input.
  const textoEscrito = event.target.value;
  // console.log(textoEscrito);
  

  if( textoEscrito != '')
  {
    pintar(null, textoEscrito, '')
  }else{
    pintar(null, textoEscrito, 758)
  }
  mostrarEntrada()
  // 
});


function archivarElemento() {

  pintar(null, '', chat_archviados)
  alternarElementos();
}

function entrada() {
    pintar(null, '', chat_activos)
    alternarElementos();
}


function alternarElementos() {
  const archivadosElemento = document.getElementById("archivados");
  const entradaElemento = document.getElementById("entrada");

  if (archivadosElemento.style.display === "none") {
    // Archivados está oculto, mostramos archivados y ocultamos entrada
    archivadosElemento.style.display = "block";
    entradaElemento.style.display = "none";
  } else {
    // Entrada está oculto, mostramos entrada y ocultamos archivados
    entradaElemento.style.display = "block";
    archivadosElemento.style.display = "none";
  }
}
function mostrarEntrada() {
  const archivadosElemento = document.getElementById("archivados");
  const entradaElemento = document.getElementById("entrada");

  if (archivadosElemento.style.display === "none") {
    // Archivados está oculto, mostramos archivados y ocultamos entrada
    archivadosElemento.style.display = "block";
    entradaElemento.style.display = "none";
  } 
}



pintar(null, '', chat_activos);


function marcar_charArchivado(destinatario_ws, nombre , estado_id) {
 console.log("marcar_charArchivado:" + estado_id)
  title = ''
  if(estado_id == 758)
  {
    title = "¿Deseas archivar esta conversación con "+nombre+" ?"
    var new_estado = 758
  }else if(estado_id == 759)
  {
    title = "¿Deseas sacar del archivo esta conversación con "+nombre+" ?"
    var new_estado = 759
  }
  

  // Mostrar ventana de confirmación
  Swal.fire({
    title: title,
    // text: "Esta acción es irreversible.",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Archivar",
    cancelButtonText: "Cancelar",
  }).then((result) => {
    // Si el usuario hace clic en "Archivar"
    if (result.isConfirmed) {
      // Realizar la llamada AJAX para archivar la conversación
      $.ajax({
        url: "find_archivar?destinatario_ws=" + destinatario_ws + "&estado_id=" + estado_id,
        type: "POST",
        data: [],
        processData: false,
        contentType: false,
        headers: {
          Authorization: tokenCSRF,
          "X-CSRFToken": tokenCSRF,
        },
        success: function (response) {
          // Pintar el contenido nuevamente después de archivar
          pintar(null, "", new_estado);
        },
        error: function (xhr, status, error) {
          alert("Error en la solicitud AJAX");
        },
      });
    }
  });
}