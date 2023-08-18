var formulario = $("#miFormulario")[0];
var formData = new FormData(formulario);

// Obtener el token CSRF
var tokenCSRF = $('input[name="csrfmiddlewaretoken"]').val();
var selectDestinatarios = $("#destinatarios");

let button = document.querySelector('.button');
let buttonText = document.querySelector('.tick');

const tickMark = "<svg width=\"58\" height=\"45\" viewBox=\"0 0 58 45\" xmlns=\"http://www.w3.org/2000/svg\"><path fill=\"#fff\" fill-rule=\"nonzero\" d=\"M19.11 44.64L.27 25.81l5.66-5.66 13.18 13.18L52.07.38l5.65 5.65\"/></svg>";

buttonText.innerHTML = "Submit";

button.addEventListener('click', function () {

  if (buttonText.innerHTML !== "Submit") {
    buttonText.innerHTML = "Submit";
  } else if (buttonText.innerHTML === "Submit") {
    buttonText.innerHTML = tickMark;
  }
  this.classList.toggle('button__circle');
});

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
  const createComponenttext = []

  data.forEach(template => {

    const templateName = template.name;
    const components = template.components;
    let Body_components = { "templateName": templateName, "language": template["language"], "components": [] }
    let text_components = { "templateName": templateName, "language": template["language"], "components": [] }

    components.forEach((component) => {

      let paramters_text = []

      if (component["format"] == "IMAGE") {

        if ("example" in component) {
          paramters_text.push({
            "type": component["type"],
            "format": component["format"],
            "text": component["example"]["header_handle"][0]
          });
        }
      } else if (component["format"] == "TEXT" || component["type"] == "BODY" || component["type"] == "FOOTER") {
        paramters_text.push({
          "type": component["type"],
          "text": component["text"],
          "format": component["format"],
        });
      }


      if ("example" in component) {
        let paramters = [];

        if ("body_text" in component["example"]) {
          component["example"]["body_text"][0].forEach((body) => {
            paramters.push({
              "type": "text",
              "text": body
            });
          });

        }
        else if ("header_handle" in component["example"]) {

          component["example"]["header_handle"].forEach((path) => {
            paramters.push({
              "type": "input",
              "path": path
            });
          });

        }

        else if ("header_text" in component["example"]) {

          console.log("sss")
          component["example"]["header_text"].forEach((body) => {
            paramters.push({
              "type": "text",
              "text": body
            });
          });

        }

        Body_components["components"].push({ "type": component["type"], "format": component["format"], "parameters": paramters });
        text_components["components"].push({ "type": component["type"], "parameters": paramters_text })
      }

    });

    createdComponents.push(Body_components);
    createComponenttext.push(text_components)

  });

  return [createdComponents, createComponenttext];
}

var [component, text_components] = createComponentsWithTemplateName(templates);
var inputsContainer = $("#variables");
var vista = $(".template-text");
var resulst = {}

function createComponent(param, selectElement, labelP = "0") {


  $.each(param["parameters"], function (index, item) {

    var highlight = $("<span>").addClass("highlight");
    var bar = $("<span>").addClass("bar");
    var label = $("<label>");
    var input = $("<input>").attr("type", item.type).addClass("text");
    if (item.text) {
      input.val(item.text);
    }

    input.on("input", function () {
      var inputValue = $(this).val();
      resulst.components.forEach((item, index_type) => {
        if (item["type"] === labelP) resulst.components[index_type].parameters[index].text = inputValue;
      });
      var selectedValue = $("#templates").val();
      vista.empty();
      resulst_text = text_components.find((template) => template["templateName"] == selectedValue);
      generaComponentText(resulst_text["components"], resulst["components"]);
    });

    label.innerHTML = `label-${index}`;
    selectElement.append(input);
    selectElement.append(highlight);
    selectElement.append(bar);
    selectElement.append(label);
  });
}


function generaComponent(jsonData) {

  jsonData.forEach((param, index) => {

    if (param["type"] == "HEADER") {

      var header = $("<div>").addClass("groups");
      header.append($("<h1>").append(param["type"]))

      if (param["format"] == "IMAGE") {
        createComponentWith(param, header, "HEADER");
      }
      else if (param["format"] == "TEXT") {
        createComponent(param, header, "HEADER");
      }
      inputsContainer.append(header);

    } else if (param["type"] == "BODY") {

      var body = $("<div>").addClass("groups");
      body.append($("<h1>").append(param["type"]))
      createComponent(param, body, "BODY");
      inputsContainer.append(body)

    } else if (param["type"] == "FOOTER") {

      var footer = $("<div>").addClass("groups");
      footer.append($("<h1>").append(param["type"]))
      createComponent(param, footer, "FOOTER");
      inputsContainer.append(footer);
    }

  });
}

function createComponentText(param, selectElement, class_name, text) {

  $.each(param["parameters"], function (_, item) {

    var message = $("<p>").addClass(class_name);
    let new_text = item["text"];

    text["parameters"].forEach((item_text, text_index) => {
      new_text = new_text.replace(`{{${text_index + 1}}}`, item_text["text"]);
    });

    message.append(new_text);
    selectElement.append(message);
  });
}

function createComponentWithFile(param, selectElement, class_name, text) {
  $.each(param["parameters"], function (_, item) {

    var message = $("<img>").addClass(class_name);
    message.attr("src", text["parameters"][0]["path"]);
    selectElement.append(message);
  });

}

function createComponentWith(param, selectElement, class_name) {

  $.each(param["parameters"], function (index, item) {

    var input = $("<input>").attr("type", "file");
    input.addClass("image_text_input")

    input.on("input", function () {
      var fileReader = new FileReader();
      fileReader.onload = function () {
        $(".img_text").attr("src", fileReader.result);
        resulst.components[0]["parameters"][0]["path"] = fileReader.result;
      };
      fileReader.readAsDataURL($(this).prop('files')[0]);
    });
    selectElement.append(input);
  });
}

function generaComponentText(jsonData, jsonDataText) {

  var message = $("<p>").addClass("message");

  jsonData.forEach((param, index) => {
    if (param["type"] == "HEADER") {

      if (jsonDataText[index]["format"] == "TEXT") {
        createComponentText(param, message, "header", jsonDataText[index]);
      } else if (jsonDataText[index]["format"] == "IMAGE") {
        createComponentWithFile(param, message, "img_text", jsonDataText[index])
      }

    }
    else if (param["type"] == "BODY") {
      createComponentText(param, message, "body", jsonDataText[index]);
    }
    else if (param["type"] == "FOOTER") {
      createComponentText(param, message, "footer", jsonDataText[index]);
    }

  });

  vista.append(message);
}

$(document).ready(function () {
  var selectElement = $("#templates");

  selectElement.change(function () {
    var selectedValue = $(this).val();
    inputsContainer.empty();
    vista.empty();
    resulst = component.find((template) => template["templateName"] == selectedValue);
    resulst_text = text_components.find((template) => template["templateName"] == selectedValue);
    generaComponent(resulst["components"]);
    generaComponentText(resulst_text["components"], resulst["components"]);
  });
});


$("#enviarBtntemplate").click(function () {
  var formulario = $("#miFormulario")[0];
  var formData = new FormData(formulario);
  formData.append("parameters", JSON.stringify(resulst));

  // Obtener el token CSRF
  var tokenCSRF2 = $('input[name="csrfmiddlewaretoken"]').val();

  // $.ajax({
  //   url: "send_message_template",
  //   type: "POST",
  //   data: formData,
  //   processData: false,
  //   contentType: false,
  //   headers: {
  //     Authorization: tokenCSRF2,
  //     "X-CSRFToken": tokenCSRF2, // También puedes incluir el token CSRF en el encabezado X-CSRFToken
  //   },
  //   success: function (response) {
  //     console.log(response)
  //   },
  //   error: function (xhr, status, error) {
  //     alert("Error en la solicitud AJAX");
  //   },
  // });
});