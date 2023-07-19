
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