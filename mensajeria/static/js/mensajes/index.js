var formulario = $("#miFormulario")[0];
var formData = new FormData(formulario);

// Obtener el token CSRF
var tokenCSRF = $('input[name="csrfmiddlewaretoken"]').val();
var selectDestinatarios = $("#destinatarios");

$.ajax({
  url: "list_destinatarios",
  type: "POST",
  data: [],
  processData: false,
  contentType: false,
  headers: {
    Authorization: tokenCSRF,
    "X-CSRFToken": tokenCSRF, // También puedes incluir el token CSRF en el encabezado X-CSRFToken
  },
  success: function (response) {
    response.forEach(function (destinatario) {
      selectDestinatarios.append(
        $("<option>", {
          value: destinatario.id,
          text: destinatario.nombre,
        })
      );
    });

    selectDestinatarios.select2();
  },
  error: function (xhr, status, error) {
    alert("Error en la solicitud AJAX");
  },
});

$("#enviarBtn").click(function () {
  var formulario = $("#miFormulario")[0];
  var formData = new FormData(formulario);

  // Obtener el token CSRF
  var tokenCSRF2 = $('input[name="csrfmiddlewaretoken"]').val();

  $.ajax({
    url: "send_message",
    type: "POST",
    data: formData,
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
      alert("Error en ssss");
    },
  });
});
