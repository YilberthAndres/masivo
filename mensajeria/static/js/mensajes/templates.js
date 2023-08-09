var formulario = $("#miFormulario")[0];
var formData = new FormData(formulario);

// Obtener el token CSRF
var tokenCSRF = $('input[name="csrfmiddlewaretoken"]').val();
var selectDestinatarios = $("#destinatarios");

// $.ajax({
//   url: "list_destinatarios",
//   type: "POST",
//   data: [],
//   processData: false,
//   contentType: false,
//   headers: {
//     Authorization: tokenCSRF,
//     "X-CSRFToken": tokenCSRF, // También puedes incluir el token CSRF en el encabezado X-CSRFToken
//   },
//   success: function (response) {
//     response.forEach(function (destinatario) {
//       selectDestinatarios.append(
//         $("<option>", {
//           value: destinatario.id,
//           text: destinatario.nombre,
//         })
//       );
//     });

//     selectDestinatarios.select2();
//   },
//   error: function (xhr, status, error) {
//     alert("Error en la solicitud AJAX");
//   },
// });


// [{ 'name': 'invitacion_prueba', 'components': 
// [{ 'type': 'HEADER', 'format': 'TEXT', 'text': 'Mensaje de invitacion {{1}}', 'example': { 'header_text': ['Nelson'] } }, 
// { 'type': 'BODY', 'text': 'Te invitamos a esta genial celebracion {{1}} para que celebrel el cumplaños de {{2}}', 'example': 
// { 'body_text': [['Nelson', 'Nelson']] } }], 'language': 'es', 'status': 'REJECTED', 'category': 'MARKETING', 'id': '346551551276883' }, 
// { 'name': 'mensaje_invitacion', 'components': [{ 'type': 'HEADER', 'format': 'TEXT', 'text': 'Te invito a una celebracion' }, 
// { 'type': 'BODY', 'text': 'Este invitado a una celebración' }], 'language': 'es', 'status': 'REJECTED', 'category': 'MARKETING', 'id': '792572599277980' }, 
// { 'name': 'hello_world', 'components': [{ 'type': 'HEADER', 'format': 'TEXT', 'text': 'Hello World' }, 
// { 'type': 'BODY', 'text': 'Welcome and congratulations!! This message demonstrates your ability to send a WhatsApp message notification from the Cloud API, hosted by Meta. Thank you for taking the time to test with us.' }, 
// { 'type': 'FOOTER', 'text': 'WhatsApp Business Platform sample message' }], 'language': 'en_US', 'status': 'APPROVED', 'category': 'UTILITY', 'id': '623372086368316' }]

function createComponentsWithTemplateName(data) {
  const createdComponents = [];

  data.forEach(template => {

    const templateName = template.name;
    const components = template.components;
    let Body_components = { "templateName": templateName, "language": template["language"], "components": [] }

    components.forEach((component) => {

      if ("example" in component) {
        let paramters = []

        if ("body_text" in component["example"]) {
          component["example"]["body_text"][0].forEach((body) => {
            paramters.push({
              "type": "text",
              "text": body
            })
          })

        } else if ("header_text" in component["example"]) {
          component["example"]["header_text"].forEach((body) => {
            paramters.push({
              "type": "text",
              "text": body
            })
          })
        }

        Body_components["components"].push({ "type": component["type"], "parameters": paramters })
      }

    });

    createdComponents.push(Body_components);

  });

  return createdComponents;
}

var component = createComponentsWithTemplateName(templates)
var inputsContainer = $("#variables");
var resulst = {}

function createComponent(param, selectElement) {
  $.each(param["parameters"], function (index, item) {

    var input = $("<input>").attr("type", item.type);
    input.css({
      "display": "block",
      "margin-top": "5px"
    });
    if (item.text) {
      input.val(item.text);
    }
    input.change(function () {
      var inputValue = $(this).val();
      resulst.components[0].parameters[index].text = inputValue;
    });
    selectElement.append(input);
  });
}

function generaComponent(jsonData) {

  jsonData.forEach((param) => {

    if (param["type"] == "HEADER") {

      var header = $("<div>");
      header.append($("<h1>").append(param["type"]))
      createComponent(param, header);
      inputsContainer.append(header);

    } else if (param["type"] == "BODY") {

      var body = $("<div>");
      body.append($("<h1>").append(param["type"]))
      createComponent(param, body);
      inputsContainer.append(body)

    } else if (param["type"] == "FOOTER") {

      var footer = $("<div>");
      footer.append($("<h1>").append(param["type"]))
      createComponent(param, footer);
      inputsContainer.append(footer)

    }


  });


}



$(document).ready(function () {
  var selectElement = $("#templates");

  selectElement.change(function () {
    var selectedValue = $(this).val();
    inputsContainer.empty();
    resulst = component.find((template) => template["templateName"] == selectedValue);
    generaComponent(resulst["components"]);
  });
});



$("#enviarBtntemplate").click(function () {
  var formulario = $("#miFormulario")[0];
  var formData = new FormData(formulario);
  formData.append("parameters", JSON.stringify(resulst));

  // Obtener el token CSRF
  var tokenCSRF2 = $('input[name="csrfmiddlewaretoken"]').val();

  $.ajax({
    url: "send_message_template",
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