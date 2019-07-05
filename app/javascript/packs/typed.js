import Typed from "typed.js"

document.addEventListener("turbolinks:load", () => {
  var typed = new Typed("#typed", {
    startDelay: 1000,
    strings: ["Buy Textbooks.", "Sell Textbooks.", "Trade Textbooks."],
    backSpeed: 40,
    typeSpeed: 80,
    loop: true
  });
});