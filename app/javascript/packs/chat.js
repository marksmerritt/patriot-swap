document.addEventListener("turbolinks:load", () => {
  $(".chatlogs").animate({
    scrollTop: $(".chatlogs").get(0).scrollHeight
  }, 1000);
});