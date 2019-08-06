$(document).on("turbolinks:load", () => {
  let userNavBtn = $("#avatar-dropdown-btn");
  let dropdown = $("#avatar-dropdown")

  $(document).click(function(){
    dropdown.hide();
  });

  userNavBtn.click(function(e){
    e.stopPropagation();
    dropdown.css("display", "block");
  });
});