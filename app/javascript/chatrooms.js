$(document).on("turbolinks:load", () =>
  $("#new_message").on("keypress", function(e) {
    if (e && (e.keyCode === 13)) {
      e.preventDefault();
      return $(this).submit();
    }
  })
);