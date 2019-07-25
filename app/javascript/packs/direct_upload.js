import { DirectUpload } from "@rails/activestorage"

document.addEventListener("turbolinks:load", () => {
  let controller = ($("body").data("controller")) == "listings";
  let action = ($("body").data("action")) == "new";

  if (controller && action){
    let input = document.querySelector('input[type=file]');
    
    const onDrop = (event) => {
      event.preventDefault()
      const files = event.dataTransfer.files;
      Array.from(files).forEach(file => uploadFile(file))
    }
     
    // Bind to normal file selection
    input.addEventListener('change', (event) => {
      Array.from(input.files).forEach(file => uploadFile(file))
      // clear the selected files from the input
      input.value = null
    })
     
    const uploadFile = (file) => {
      // make sure form has file_field direct_upload: true, which
      //  provides data-direct-upload-url
      const url = input.dataset.directUploadUrl
      const upload = new DirectUpload(file, url)
  
      upload.create((error, blob) => {
        if (error) {
          conrole.log(error);
        } else {
          const hiddenField = document.createElement('input')
          hiddenField.setAttribute("type", "hidden");
          hiddenField.setAttribute("value", blob.signed_id);
          hiddenField.name = input.name
          document.querySelector('.new-listing__form').appendChild(hiddenField)
        }
      })
    }
  }
});


 
