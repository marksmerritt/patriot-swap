import toastr from "toastr"

document.addEventListener("turbolinks:load", () => {
  var flashMessage = $(".flash-message");
  if ( flashMessage.length ) {
    toastr.options = {
      "positionClass": "toast-bottom-center",
      "preventDuplicates": false,
      "onclick": null,
      "showDuration": "300",
      "hideDuration": "1000",
      "timeOut": "5000",
      "extendedTimeOut": "1000",
      "showEasing": "swing",
      "hideEasing": "linear",
      "showMethod": "fadeIn",
      "hideMethod": "fadeOut"
    }

    var type = flashMessage.data("type");
    var message = flashMessage.data("message");

    switch(type) {
      case "notice":
        toastr.success(message);
        break;
      case "alert":
        toastr.success(message);
        break;
      case "success":
        toastr.success(message);
        break;
      case "error":
        toastr.error(message);
        break;
      default:
        toastr.error("Something went wrong.");
    }
  }
});