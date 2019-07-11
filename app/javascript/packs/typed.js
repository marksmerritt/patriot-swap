import Typed from "typed.js"

let controller = ($("body").data("controller")) == "welcome";
let action = ($("body").data("action")) == "index";

if (controller && action){
  document.addEventListener("turbolinks:load", () => {
    var typed = new Typed("#typed", {
      startDelay: 1000,
      strings: ["Buy", "Sell", "Trade"],
      backSpeed: 100,
      typeSpeed: 100,
      loop: true
    });
  });
}