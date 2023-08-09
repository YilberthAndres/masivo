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

    components.forEach(component => {

      if ("example" in component) {
        const exampleKeys = Object.keys(component.example);

        exampleKeys.forEach(exampleKey => {
          const exampleValues = component.example[exampleKey];

          exampleValues.forEach(exampleValue => {
            const newComponent = {
              templateName: templateName,
              type: component.type,
              key: exampleKey,
              value: exampleValue,
              text: component.text
            };

            createdComponents.push(newComponent);
          });
        });
      } else {
        const newComponent = {
          templateName: templateName,
          type: component.type,
          text: component.text
        };

        createdComponents.push(newComponent);
      }

    });

  });

  return createdComponents;
}

var component = createComponentsWithTemplateName(templates)


$("#enviarBtntemplate").click(function () {
  var formulario = $("#miFormulario")[0];
  var formData = new FormData(formulario);
  formData.append("parameters", JSON.stringify(component));

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