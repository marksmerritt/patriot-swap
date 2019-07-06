import consumer from "./consumer"

consumer.subscriptions.create("ConversationChannel", {
  connected() {
    // console.log("We are live");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) { 
    $(`#conversation-btw-${data.seller_id}-${data.buyer_id}`).append(`<p class="chat__message chat__message--live">${data.sender_name}: ${data.body}</p>`);
    $(`#new-message-body-${data.sender_id}`).val("");
  }
});







