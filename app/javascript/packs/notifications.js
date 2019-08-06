// TODO: Major Refactor

$(document).on("turbolinks:load", () => {
  let notifications = $("[data-behavior='notifications']");
  let notificationsLink = $("[data-behavior='notifications-link']");
  let notificationAlert = $(".user-nav__notification");
  
  $(document).click(function(){
    notifications.hide();
  });

  notificationsLink.click(function(e){
    e.stopPropagation();
  });

  notificationsLink.on("click", function(){
    $.ajax({
      url: "/notifications/mark_as_read",
      dataType: "JSON",
      method: "POST",
      success: function(){
        notificationAlert.hide();
      }
    })
  });

  if( notifications.length > 0 ){
    notificationsLink.on("click", function(){
      notifications.css("display", "block");
    });

    $.ajax({
      url: "/notifications.json",
      dataType: "JSON",
      method: "GET",
      success: handleSuccess
    });

    function handleSuccess(data) {
      let notifications = $("[data-behavior='notification-items']");
      let unreadCount = $("[data-behavior='unread-count']");

      notifications.html("");

      if(data.length > 0){
        unreadCount.text(data.length);
        data.forEach(function(notification) {
          notifications.append(
            `<li class='notification-item'><a href='${notification.url}' class='notification-link'>${notification.actor} ${notification.notifiable.type} ${notification.action}</a></li>`
          );
        });
      } else {
        notificationAlert.css("display", "none");
        notifications.append("Nothing to see here...");
      }  
    }
  }
});