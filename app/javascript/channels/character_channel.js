import consumer from "./consumer"

consumer.subscriptions.create("CharacterChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('.wrap-char-form').fadeOut(200);
    $(`#character-name${data.content.pc_number}`).html(
      `${data.content.character_name} (PC${data.content.pc_number})`
    );
    console.log(`${data.content.character_name}`);
    $('.js-message-errors').empty();
  }
});
