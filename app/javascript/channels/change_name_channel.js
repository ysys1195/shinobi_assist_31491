import consumer from "./consumer"

consumer.subscriptions.create("ChangeNameChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('test');
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data.character.pc_number);
    $(`#character-name${data.character.pc_number}`).html(
      `${data.character.character_name} (PC${data.character.pc_number})`
    );
  }
});
