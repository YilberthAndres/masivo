<<<<<<< HEAD

function save(dato) {

    var formulario = $("#formEnvio")[0];
    var formData = new FormData(formulario);
    formData.append("texto", dato)

    formData.append("adjunto",$("#adjunto").val())

    $.ajax({
        url: "create/",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
            // Lógica para manejar la respuesta del servidor
            if (response.success) {
                console.log("Ok")
            } else {
                alert("Error");
            }
        },
        error: function (xhr, status, error) {
            // Lógica para manejar el error
            alert("Error en la solicitud AJAX");
        }
    });

}


function getStatics() {

    var formulario = $("#miFormulario")[0];
    var formData = new FormData(formulario);

    $.ajax({
        url: "/multimedia/list",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
            var element = $("#adjunto");
            response.forEach(data => {
                var o = new Option(data.nombre, data.dir);

                element.append(o)
            });
        },
        error: function (xhr, status, error) {
            // Lógica para manejar el error
            alert("Error en la solicitud AJAX");
        }
    });
}

getStatics();
=======
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
      alert("Error en la solicitud AJAX");
    },
  });
});
>>>>>>> 85fd95746d3fe21047cb8063842e7d15fe2c893d
