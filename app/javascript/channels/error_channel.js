import consumer from "./consumer"

consumer.subscriptions.create("ErrorChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    data.content.forEach( function(msg) {
      $('.js-message-errors').append(`<div style='color: black';>${msg}</div>`);
    });
    $('.wrap-char-form').fadeOut(200);
  }
});