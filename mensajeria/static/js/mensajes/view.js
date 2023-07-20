// const socket = new WebSocket('ws://127.0.0.1:8000/ws/chat/kakao/');

// socket.onopen = (event) => {
//   console.log('Conectado al servidor WebSocket');
// };

// socket.onmessage = (event) => {
//   const data = JSON.parse(event.data);
//   // Actualiza la tabla de mensajes con los datos recibidos
//   updateTable(data.messages);
// };

// socket.onclose = (event) => {
//   console.log('Conexión WebSocket cerrada');
// };

// var formulario = $("#miFormulario")[0];
// var formData = new FormData(formulario);

// Obtener el token CSRF
var tokenCSRF = $('input[name="csrfmiddlewaretoken"]').val();
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

        // $("#enviarBtn").click(function () {
          // var formulario = $("#miFormulario")[0];
          // var formData = new FormData(formulario);
        
          // // Obtener el token CSRF
          var tokenCSRF2 = $('input[name="csrfmiddlewaretoken"]').val();
        
          $.ajax({
            url: "get_menssage/"+mensaje.recipiente_id,
            type: "POST",
            data: [],
            processData: false,
            contentType: false,
            headers: {
              Authorization: tokenCSRF2,
              "X-CSRFToken": tokenCSRF2, // También puedes incluir el token CSRF en el encabezado X-CSRFToken
            },
            success: function (response) {
              console.log(response)
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
