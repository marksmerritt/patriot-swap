import Typed from "typed.js"

document.addEventListener("turbolinks:load", () => {
  var typed = new Typed("#typed", {
    startDelay: 1000,
    strings: ["Buy", "Sell", "Trade"],
    backSpeed: 80,
    typeSpeed: 80,
    loop: true
  });
});