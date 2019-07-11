let controller = ($("body").data("controller")) == "listings";
let action = ($("body").data("action")) == "show";

if (controller && action){
  document.addEventListener("turbolinks:load", () => {
    $(".chatlogs").animate({
      scrollTop: $(".chatlogs").get(0).scrollHeight
    }, 1000);
  });
}