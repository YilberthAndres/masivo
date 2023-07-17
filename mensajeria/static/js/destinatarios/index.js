function borrar(id, nombre) {
  Swal.fire({
    title: 'Confirmar borrado',
    text: '¿Deseas al destinatario '+nombre+'?',
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
            Swal.fire('Éxito', 'destinatario borrado exitosamente', 'success');
            list_destinatarios();
          } else {
            Swal.fire('Error', 'Error al borrar el destinatario', 'error');
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


  function init_table()
{
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
            sortDescending: ": Activar para ordenar la columna en orden descendente",
          },
        },
        "order": [[1, "asc"]],
      });
}
  

function list_destinatarios()
{

    var formulario = $("#miFormulario")[0];
    var formData = new FormData(formulario);

    $.ajax({
        url: "list",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            console.log(response)
          // Manejar la respuesta del servidor aquí
          
          var table = $('#example');
          if ($.fn.DataTable.isDataTable(table))
          {
              table.DataTable().destroy();
          }
          // Limpiar el contenido existente del cuerpo de la tabla
          var tableBody = $('#example tbody');
          tableBody.empty();
          num = 0;
          response.forEach(function(row) {
            // console.log(row)
            num++;
              var newRow = $('<tr>');
              if (row.estado == 596) {
                newRow.append($('<td>').addClass('text-center')
                  .append($('<div>').addClass('btn-group')
                    .append($('<a>').addClass('btn')
                      .append($('<span>').addClass('fa-brands fa-brands fa-whatsapp  fa-lg')
                        .attr('style', 'color: #57e723;') // Establecer el color verde directamente
                      )
                    )
                  )
                );
              } else {
                newRow.append($('<td>').addClass('text-center')
                  .append($('<div>').addClass('btn-group')
                    .append($('<a>').addClass('btn')
                      .append($('<span>').addClass('fa-brands fa-brands fa-whatsapp  fa-lg')
                        .attr('style', 'color: #ff0000;') // Establecer el color rojo directamente
                      )
                    )
                  )
                );
              }
              
              
              
              
              newRow.append($('<td>').text(row.nombre).addClass('text-center'));
              newRow.append($('<td>').addClass('text-center').text(row.celular).addClass('text-center'));
              // newRow.append($('<td>').addClass('text-center').text(row.nombre_usuario).addClass('text-center'));
              // newRow.append($('<td>').addClass('text-center').text(row.created_at).addClass('text-center'));
              newRow.append($('<td>').addClass('text-center')
                .append($('<div>').addClass('btn-group')
                    .append($('<a>')
                        .attr("onclick", "borrar(" + row.id + ", '" + row.nombre + "')")
                        .append($('<span>').addClass('fa-sharp fa-solid fa-trash fa-lg')
                        .attr('style', 'color: #ff0000;'))
                    )
                )
              );

              tableBody.append(newRow);
          });

          init_table();
        },
        error: function(xhr, status, error) {
            // Lógica para manejar el error
            alert("Error en la solicitud AJAX");
        }
    });


}

list_destinatarios();