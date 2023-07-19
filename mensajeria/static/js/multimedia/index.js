function borrar(id, nombre) {
  Swal.fire({
    title: 'Confirmar borrado',
    text: '¿Deseas borrar el archivo: '+nombre+'?',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Sí',
    cancelButtonText: 'No'
  }).then((result) => {
    if (result.isConfirmed) {
      Swal.fire({
        title: 'Borrando...',
        allowOutsideClick: false,
        onBeforeOpen: () => {
          Swal.showLoading();
        }
      });

      var formulario = $("#miFormulario")[0];
      var formData = new FormData(formulario);

      $.ajax({
        url: id + "/delete",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
          Swal.close();

          if (response.success) {
            Swal.fire('Éxito', 'Archivo borrado exitosamente', 'success');
            list_archivos();
          } else {
            Swal.fire('Error', 'Error al borrar el archivo', 'error');
          }
        },
        error: function (xhr, status, error) {
          Swal.close();
          Swal.fire('Error', 'Error en la solicitud AJAX', 'error');
        },
      });
    }
  });
}


function init_table() {
  $("#example").DataTable({
    language: {
      emptyTable: "No hay datos disponibles en la tabla",
      info: "Mostrando _START_ al _END_ de _TOTAL_ registros",
      infoEmpty: "Mostrando 0 al 0 de 0 registros",
      infoFiltered: "(filtrados de un total de _MAX_ registros)",
      lengthMenu: "Mostrar _MENU_ registros",
      loadingRecords: "Cargando...",
      processing: "Procesando...",
      search: "Buscar:",
      zeroRecords: "No se encontraron registros coincidentes",
      paginate: {
        first: "Primero",
        last: "Último",
        next: "Siguiente",
        previous: "Anterior",
      },
      aria: {
        sortAscending: ": Activar para ordenar la columna en orden ascendente",
        sortDescending:
          ": Activar para ordenar la columna en orden descendente",
      },
    },
  });
}

function list_archivos() {
  var formulario = $("#miFormulario")[0];
  var formData = new FormData(formulario);

  $.ajax({
    url: "list",
    type: "POST",
    data: formData,
    processData: false,
    contentType: false,
    success: function (response) {
      console.log(response);
      // Manejar la respuesta del servidor aquí

      var table = $("#example");
      if ($.fn.DataTable.isDataTable(table)) {
        table.DataTable().destroy();
      }
      // Limpiar el contenido existente del cuerpo de la tabla
      var tableBody = $("#example tbody");
      tableBody.empty();
      num = 0;
      response.forEach(function (row) {
        // console.log(row)
        num++;
        var newRow = $("<tr>");
        newRow.append(
          $("<td>").addClass("text-center").text(num).addClass("text-left")
        );
        newRow.append($("<td>").text(row.nombre).addClass("text-left"));
        newRow.append(
          $("<td>")
            .addClass("text-center")
            .append(
              $("<div>")
                .addClass("btn-group")
                .append(
                  $("<a>")
                    .addClass("btn btn-primary")
                    .attr("href",  row.dir)
                    .attr("target", "_blank") // Agrega el atributo target="_blank"
                    .append($("<span>").addClass("fa fa-eye"))
                )
            )
        );

        newRow.append(
          $("<td>")
            .addClass("text-center")
            .text(row.nombre_usuario)
            .addClass("text-center")
        );
        newRow.append(
          $("<td>")
            .addClass("text-center")
            .text(row.created_at)
            .addClass("text-center")
        );
        newRow.append(
          $("<td>")
            .addClass("text-center")
            .append(
              $("<div>")
                .addClass("btn-group")
                .append(
                  $("<a>")
                    .addClass("btn btn-danger")
                    .attr("onclick", "borrar(" + row.id + ", '" + row.nombre + "')")
                    .append($("<span>").addClass("fa fa-trash"))
                )
            )
        );
        

        tableBody.append(newRow);
      });

      init_table();
    },
    error: function (xhr, status, error) {
      // Lógica para manejar el error
      alert("Error en la solicitud AJAX");
    },
  });
}

list_archivos();
