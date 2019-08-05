document.addEventListener("turbolinks:load", () => {
  let controller = $("body").data("controller") == "listings";
  let action = $("body").data("action") == "show";

  if (controller && action){
    $(".chatbox").first().css("display", "block");

    let convo_links = $(".convo-show-link");
    
    convo_links.each(function() {
      $(this).on("click", function(e) {
        e.preventDefault();
        let seller_id = $(this).data("seller-id");
        let buyer_id = $(this).data("buyer-id");
        let link_clicked = $(`#chatbox-btw-${seller_id}-${buyer_id}`);

        if($(link_clicked)) {
          e.preventDefault();
          $(".chatbox").css("display", "none");
          $(`#chatbox-btw-${seller_id}-${buyer_id}`).css("display", "block");
          $(".convo-show-link").removeClass("convo-show-link__active");
          $(`#convo-link-btw-${seller_id}-${buyer_id}`).addClass("convo-show-link__active");

          let conversation = $("`#conversation-btw-${seller_id}-${buyer_id}`");
          conversation.animate({
            scrollTop: conversation.get(0).scrollHeight
          }, 1000);
        } 
      });
    });
  }
});

