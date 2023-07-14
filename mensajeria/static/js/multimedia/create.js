$(document).ready(function () {
  // Función para validar el tamaño del archivo
  function validarArchivo() {
    var archivo = document.getElementById("archivo").files[0];
    var tamañoMaximo = 1024 * 1024; // 1 MB

    if (archivo && archivo.size > tamañoMaximo) {
      // alert(");
      Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "El archivo no debe exceder 1 MB de tamaño.",
        // footer: '<a href="">Why do I have this issue?</a>'
      });
      document.getElementById("archivo").value = "";
    }
  }

  // Asignar evento onchange al campo de archivo
  $("#archivo").change(validarArchivo);

  // Enviar el formulario mediante AJAX
  $("#guardarBtn").click(function () {
    var formulario = $("#miFormulario")[0];
    var formData = new FormData(formulario);

    var descripcion = document.getElementById("descripcion").value;
    var archivo_value = document.getElementById("archivo").value;

    if (descripcion == "") {
      Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "El archivo debe tener un nombre.",
        // footer: '<a href="">Why do I have this issue?</a>'
      });
    } else if (archivo_value == "") {
      Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "Debe cargar un archivo.",
        // footer: '<a href="">Why do I have this issue?</a>'
      });
    } else {
      // Mostrar mensaje de carga
      Swal.fire({
        title: "Cargando...",
        allowOutsideClick: false,
        onBeforeOpen: () => {
          Swal.showLoading();
        },
      });

      $.ajax({
        url: "uploaded",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
          // Cerrar mensaje de carga
          Swal.close();

          // Lógica para manejar la respuesta del servidor
          if (response.success) {
            // Mostrar mensaje de éxito
            Swal.fire("Éxito", "Archivo guardado exitosamente", "success");
            document.getElementById("descripcion").value = '';
            document.getElementById("archivo").value = '';
          } else {
            // Mostrar mensaje de error
            Swal.fire("Error", "Error al guardar el Archivo", "error");
          }
        },
        error: function (xhr, status, error) {
          // Cerrar mensaje de carga
          Swal.close();

          // Mostrar mensaje de error
          Swal.fire("Error", "Error en la solicitud AJAX", "error");
        },
      });
    }
  });
});
