import consumer from "./consumer"

consumer.subscriptions.create("ConversationChannel", {
  connected() {
    // console.log("We are live");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {    
    $(`#conversation-btw-${data.seller_id}-${data.buyer_id}`).append(`<div>${data.sender_name}: ${data.body}</div>`);
    $(`#new-message-body-${data.sender_id}`).val("");
  }
});







