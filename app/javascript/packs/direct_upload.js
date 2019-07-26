import { DirectUpload } from "@rails/activestorage"
import Dropzone from "dropzone"
Dropzone.autoDiscover = false;

document.addEventListener("turbolinks:load", () => {
  let controller = ($("body").data("controller")) == "listings";
  let action = ($("body").data("action")) == "new";

  if (controller && action){
    let input = $("input[type=file]");
    let url = $("#images-uploader").data("directUploadUrl");
    let dz = $("#images-dropzone");
    
    dz.dropzone({ 
      url: url,
      autoProcessQueue: false,
      acceptedFiles: 'image/*',
      addRemoveLinks: true,
      clickable: false,
      maxFiles: 4,
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      init: function() {
        this.on("addedfile", function(file) {
          if(file['type'].split('/')[0] === 'image'){
            setTimeout(function(){ 
              if(file.accepted) {
                uploadFile(file);
                $(".dz-progress").remove();  
                $();
              } 
            }, 1000);
          }
        }),
        this.on("removedfile", function(file) {
          let id = file._removeLink.id;

          $("input[type=hidden]").each(function() {
            if ($(this).val() === id) {
              $(this).remove();
            };
          });
        })
      }
    })

    // Bind to normal file selection
    input.on('change', (event) => {
      Array.from(input.files).forEach(file => uploadFile(file))
      // clear the selected files from the input
      input.value = null
    })
     
    function uploadFile(file) {
      // make sure form has file_field direct_upload: true, which
      //  provides data-direct-upload-url
      const url = input.data("directUploadUrl");
      const upload = new DirectUpload(file, url)
  
      upload.create((error, blob) => {
        if (error) {
          console.log(error);
        } else {
          const hiddenField = document.createElement('input');
          hiddenField.setAttribute("type", "hidden");
          hiddenField.setAttribute("value", blob.signed_id);
          hiddenField.setAttribute("name", "listing[images][]");
          document.querySelector('.new-listing__form').appendChild(hiddenField);
          $(".dz-remove").last().attr("id", blob.signed_id);
        }
      })
    }
  }
});


 
