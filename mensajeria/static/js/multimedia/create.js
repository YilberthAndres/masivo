$(document).ready(function() {
    // Función para validar el tamaño del archivo
    function validarArchivo() {
        var archivo = document.getElementById("archivo").files[0];
        var tamañoMaximo = 1024 * 1024; // 1 MB

        if (archivo && archivo.size > tamañoMaximo) {
            alert("El archivo no debe exceder 1 MB de tamaño.");
            document.getElementById("archivo").value = "";
        }
    }

    // Asignar evento onchange al campo de archivo
    $("#archivo").change(validarArchivo);

    // Enviar el formulario mediante AJAX
    $("#guardarBtn").click(function() {
        var formulario = $("#miFormulario")[0];
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
});


