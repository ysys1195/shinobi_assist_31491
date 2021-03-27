import consumer from "./consumer"

consumer.subscriptions.create("ErrorChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const HTML = `
    <% if data.content.errors %>
      <div class="validates js-message-errors", style="margin-top: 20px;">
          <ul>
            <% data.content.errors.full_messages.each do |msg| %>
              <li style="color: black;"><%= msg %></li>
            <% end %>
          </ul>
        </div>
    <% end %>
    `
    $('.js-message-errors').html(HTML);
    $('.wrap-char-form').fadeOut(200);
  }
});
