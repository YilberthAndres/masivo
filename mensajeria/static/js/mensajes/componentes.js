function mensaje_texto(chat, tipo) {
    const messageContent = document.querySelector(".message-content");
    const chatMessage = document.createElement("p");

    if (tipo == 'recibido') {
        chatMessage.classList.add("chat-message");
    } else if (tipo == 'enviado') {
        chatMessage.classList.add("chat-message", "chat-sent");
    }

    chatMessage.textContent = chat.texto;
    chatMessage.id = `mensaje_${chat.id}`;

    const chatTimestamp = document.createElement("span");
    chatTimestamp.classList.add("chat-timestamp");

    if ('hora' in chat) {
        chatTimestamp.textContent = chat.hora;
    } else {
        var currentTime = hora_minutos()
        chatTimestamp.textContent = currentTime;
    }

    chatMessage.appendChild(chatTimestamp);
    messageContent.appendChild(chatMessage);
}


function mensaje_img(chat, tipo) {
    const messageContent = document.querySelector(".message-content");

    const chatMessage = document.createElement("div");
    if (tipo == 'recibido') {
        chatMessage.classList.add("chat-message");
    } else if (tipo == 'enviado') {
        chatMessage.classList.add("chat-message", "chat-sent");
    }
    chatMessage.id = `mensaje_${chat.id}`;

    const chatImage = document.createElement("img");
    chatImage.classList.add("chat-image");
    chatImage.style.cursor = "pointer";
    chatImage.src = chat.dir;

    const chatTimestamp = document.createElement("span");
    chatTimestamp.classList.add("chat-timestamp");
    if ('hora' in chat) {
        chatTimestamp.textContent = chat.hora;
    } else {
        var currentTime = hora_minutos()
        chatTimestamp.textContent = currentTime;
    }

    chatMessage.appendChild(chatImage);
    chatMessage.appendChild(chatTimestamp);
    messageContent.appendChild(chatMessage);
}

function mensaje_video(chat, tipo) 
{
    const messageContent = document.querySelector(".message-content");
    const chatMessage = document.createElement("div");
    if (tipo == 'recibido') {
        chatMessage.classList.add("chat-message");
    } else if (tipo == 'enviado') {
        chatMessage.classList.add("chat-message", "chat-sent");
    }
    chatMessage.id = `mensaje_${chat.id}`;

    const chatVideo = document.createElement("video");
    chatVideo.classList.add("chat-video");
    chatVideo.classList.add("video-container"); // Nueva clase para identificar el contenedor de video
    chatVideo.style.cursor = "pointer";
    chatVideo.src = chat.dir; // Aquí asignas la URL del video

    // Configurar las opciones del video
    chatVideo.controls = true; 
    chatVideo.autoplay = false; 

    const chatTimestamp = document.createElement("span");
    chatTimestamp.classList.add("chat-timestamp");
    if ('hora' in chat) {
        chatTimestamp.textContent = chat.hora;
    } else {
        var currentTime = hora_minutos()
        chatTimestamp.textContent = currentTime;
    }

    chatMessage.appendChild(chatVideo);
    chatMessage.appendChild(chatTimestamp);
    messageContent.appendChild(chatMessage);
}

function mensaje_file(chat, tipo)
{
    console.log(chat)
    const messageContent = document.querySelector(".message-content");
    const chatMessage = document.createElement("div");
    chatMessage.classList.add("chat-message");
    chatMessage.id = `mensaje_${chat.id}`;

    const chatFile = document.createElement("div");
    if (tipo == 'recibido') {
        chatMessage.classList.add("chat-message");
    } else if (tipo == 'enviado') {
        chatMessage.classList.add("chat-message", "chat-sent");
    }
    chatFile.style.cursor = "pointer";

    // Determinamos qué tipo de archivo es para mostrar el ícono adecuado
    if (esPDF(chat.filename)) {
      // Mostrar ícono para PDF
      chatFile.innerHTML = '<i class="fa-solid fa-file-pdf" style="color: #d60a0a;"></i>';
    } else if (esWord(chat.filename)) {
      // Mostrar ícono para Word
      chatFile.innerHTML = '<i class="far fa-file-word"></i>';
    } else if (esExcel(chat.filename)) {
      // Mostrar ícono para Excel
      chatFile.innerHTML = '<i class="far fa-file-excel"></i>';
    } else {
      // Mostrar ícono genérico para otros tipos de archivos
      chatFile.innerHTML = '<i class="far fa-file"></i>';
    }

    const chatFileName = document.createElement("p");
    chatFileName.textContent = chat.filename;

    const chatTimestamp = document.createElement("span");
    chatTimestamp.classList.add("chat-timestamp");
    if ('hora' in chat) {
        chatTimestamp.textContent = chat.hora;
    } else {
        var currentTime = hora_minutos()
        chatTimestamp.textContent = currentTime;
    }

    // Agregar el enlace de descarga con el nombre del archivo
    const downloadLink3 = document.createElement("a");
    downloadLink3.href = chat.dir;
    downloadLink3.download = chat.filename // Asignamos el nombre del archivo como atributo "download"
    downloadLink3.textContent = "Descargar";

    chatMessage.appendChild(chatFile);
    chatMessage.appendChild(chatFileName);
    chatMessage.appendChild(downloadLink3);
    chatMessage.appendChild(chatTimestamp);
     

    messageContent.appendChild(chatMessage);
}

function hora_minutos()
{

    const currentDate = new Date();
    const currentHours = currentDate.getHours();
    const currentMinutes = currentDate.getMinutes();
    const formattedMinutes = currentMinutes < 10 ? `0${currentMinutes}` : currentMinutes;
    const currentTime = `${currentHours}:${formattedMinutes}`;

    return currentTime

}