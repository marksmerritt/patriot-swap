import consumer from "./consumer"

consumer.subscriptions.create("ConversationChannel", {
  connected() {
    // console.log("We are live");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) { 
    let style = (data.current_user_id == data.seller_id ? "seller" : "current-user");
    $(`#conversation-btw-${data.seller_id}-${data.buyer_id}`).append(`<div class="chat">
                                                                        <p class="chat__message chat__message--${style}">${data.body}</p>
                                                                        <p class="sent-at">Sent</p>
                                                                      </div>`);
    $(`#new-message-body-${data.sender_id}`).val("");
  }
});


