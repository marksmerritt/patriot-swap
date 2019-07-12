import Typed from "typed.js"

document.addEventListener("turbolinks:load", () => {
  let controller = ($("body").data("controller")) == "welcome";
  let action = ($("body").data("action")) == "index";

  if (controller && action){
    var typed = new Typed("#typed", {
      startDelay: 1000,
      strings: ["Buy", "Sell", "Trade"],
      backSpeed: 100,
      typeSpeed: 100,
      loop: true
    });
  }
});