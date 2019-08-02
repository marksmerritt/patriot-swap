$(document).on("turbolinks:load", () => {
  let controller = ($("body").data("controller")) == "listings";
  let action = ($("body").data("action")) == "new";

  if (controller && action){
    if ($(".nested-fields").length == 1) {
      $(".remove_fields")[0].style.display = "none";
    } 

    $('#tags').on('cocoon:after-insert', function() {
      $(".remove_fields")[0].style.display = "inline-block";

      if ($('#tags .nested-fields').length == 3) {
        $('#add-tag').hide();
      } else {
        $('#add-tag').show();
      }
    }); 
  }
});