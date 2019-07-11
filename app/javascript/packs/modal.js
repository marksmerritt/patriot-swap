document.addEventListener("turbolinks:load", () => {
  let closeBtn = $(".closeBtn");
  
  $(".listing-details__img").each(function(i){ 
    $(`#listing-details__img--${i}`).on("click", function() {
      let modal = $(`#listing-details__img-modal--${i}`);
      modal.css("display", "block");
    });    
  });

  closeBtn.click(function(e) {
    closeModal();
  });
  
  $(document).click(function(e) {
    if($(e.target).hasClass("modal")) {
      closeModal();
    };
  });

  function closeModal(){
    let modal = $(".modal");
    modal.css("display", "none");
  }
});



