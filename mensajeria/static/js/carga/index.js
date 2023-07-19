$("#miFormulario").submit(function(event) {
    event.preventDefault(); // Evita el envío predeterminado del formulario

    var formulario = $(this)[0];
    var formData = new FormData(formulario);

    Swal.fire({
        title: 'Cargando...',
        allowOutsideClick: false,
        onBeforeOpen: () => {
            Swal.showLoading();
        }
    });

    fetch("uploaded", {
        method: "POST",
        body: formData
    })
    .then(response => response.blob())
    .then(blob => {
        // Crea un objeto URL para el blob
        var url = URL.createObjectURL(blob);

        // Crea un enlace de descarga y dispara automáticamente la descarga
        var linkDescarga = document.createElement("a");
        linkDescarga.href = url;
        linkDescarga.download = "archivo.xlsx";
        linkDescarga.click();

        // Libera el objeto URL
        URL.revokeObjectURL(url);
        Swal.fire('Éxito', 'Archivo cargado exitosamente', 'success');
    })
    .catch(error => {
        // Lógica para manejar el error
        // console.log("Error en la solicitud fetch:", error);
        Swal.fire('Error', 'Error al cargar el ecxel', 'error');
    });
});

