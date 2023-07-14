var add_permission = [];
var delete_permission = [];

function check(id) {
  if ($("#act_" + id).length) {
    if ($("#act_" + id).is(":checked")) {
      let index = delete_permission.indexOf(id);
      if (index !== -1) delete_permission.splice(index, 1);
    } else {
      delete_permission.push(id);
    }
  } else if ($("#des_" + id).length) {
    if ($("#des_" + id).is(":checked")) {
      add_permission.push(id);
    } else {
      let index = add_permission.indexOf(id);
      if (index !== -1) add_permission.splice(index, 1);
    }
  }
}

$(function () {
  $("#submit-btn").click(function () {

    var formData = new FormData();
    formData.append('name', $("#name").val());
    formData.append('add_permission', JSON.stringify(add_permission));
    formData.append('delete_permission', JSON.stringify(delete_permission));
    formData.append('img', $("#file-input")[0].files[0]);
    // console.log($("#file-input")[0].files[0]);

    $.ajax({
      type: "POST",
      url: $("#rol-form").attr("action"),
      data: formData,
      processData: false,
      contentType: false,
      success: function (data) {

        for (let i = 0; i < add_permission.length; i++) {
          if ($("#des_" + add_permission[i]).length)
            $("#des_" + add_permission[i]).attr(
              "id",
              "act_" + add_permission[i]
            );
        }

        for (let i = 0; i < delete_permission.length; i++) {
          if ($("#act_" + delete_permission[i]).length)
            $("#act_" + delete_permission[i]).attr(
              "id",
              "des_" + delete_permission[i]
            );
        }

        console.log(data)
        if(data.message == 'exito'){
          Swal.fire({
            position: "center",
            icon: "success",
            title: '!Actualizado correctamente¡',
            showConfirmButton: false,
            timer: 1500,
          });
        }else{

          Swal.fire({
            position: "center",
            icon: "error",
            title: '!Ocurrió un error¡',
            showConfirmButton: false,
            timer: 1500,
          });

        }
          

      },
      error: function (jqXHR, textStatus, errorThrown) {
        // console.log("Error:", errorThrown);
        Swal.fire({
          position: "center",
          icon: "error",
          title: '!Ocurrió un error¡',
          showConfirmButton: false,
          timer: 1500,
        });
      },
    });
  });
});


// function comprimir(){
//     var img;
//     const fileInput = document.querySelector("#file-input");
//     const file = fileInput.files[0];
//     const compressor = new Compressor(file, {
//       quality: 0.6,
//       success(result) {
//         img  = result
//         console.log(img)
//       },
//       error(err) {
//         console.log(err.message);
//       },
//     });

//     return img;
// }

function previewImage() {
  const preview = document.getElementById("image-preview");
  const file = document.getElementById("file-input").files[0];
  const reader = new FileReader();

  // Solo continuar si el archivo es una imagen jpg o png
  if (!file || !file.type.match(/image\/(jpeg|png)/)) {
    return;
  }

  reader.onload = function (event) {
    const image = new Image();
    image.src = event.target.result;
    image.style.maxWidth = "100%";
    preview.innerHTML = "";
    preview.appendChild(image);
    document.getElementById("remove-image").style.display = "block";
  };

  reader.readAsDataURL(file);
}

function removeImage() {
  const preview = document.getElementById("image-preview");
  preview.innerHTML = "";
  document.getElementById("file-input").value = "";
  document.getElementById("remove-image").style.display = "none";
}
