$("#miFormulario").submit(function(event) {
    event.preventDefault(); // Evita que el formulario se envíe de forma predeterminada
    var formulario = $(this)[0];
    var formData = new FormData(formulario);

    $.ajax({
        url: "uploaded",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            // Lógica para manejar la respuesta del servidor
            if (response.success) {
                console.log(response);
                alert("Formulario guardado exitosamente");
            } else {
                alert("Error al guardar el formulario");
            }
        },
        error: function(xhr, status, error) {
            // Lógica para manejar el error
            alert("Error en la solicitud AJAX");
        }
    });
});
