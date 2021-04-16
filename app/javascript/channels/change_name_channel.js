import consumer from "./consumer"

consumer.subscriptions.create("ChangeNameChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    $(`#character-name${data.character.pc_number}`).html(
      `${data.character.character_name} (PC${data.character.pc_number})`
    );
    $('.wrap-char-form').fadeOut(200);
    $('.js-message-errors').empty();
    $('.error-msg').empty();
  }
});
