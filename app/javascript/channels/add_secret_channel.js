import consumer from "./consumer"

consumer.subscriptions.create("AddSecretChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    
  // <%= j(render 'open_secrets/open_close', num: ${data.secret.num}, selected_char: ${data.secret.selected_char}, s: ${data.content}) %>

  const HTML = `
  <% if @open_secrets.find_by(secret_unveil_to: @role, unveiled_id: 2, secret_id: s.id) != nil ||
        @role == 200 ||
        @role == selected_char.pc_number %>
    <div class="bubble-list">
      <button class="unveiled", data-target="unveil-secret${data.secret.num}-${data.content.secret_n}"><%= "秘密${data.content.secret_n}" %></button>
      <div class="wrap-char-form" id="unveil-secret${data.secret.num}-${data.content.secret_n}">
        <div class="form-background"></div>
        <div class="condition-feeling-form">
          <div class="form-title">
          ${data.secret.selected_char.character_name}の秘密(PC${data.secret.num})
          </div>
          <div class="form-contents">
            <div class="unveil-content", id="show-secret-${data.secret.num}-${data.content.secret_n}">
              ${data.content.secret}
            </div>
          </div>
        </div>
      </div>

      <%# 秘密編集モーダル表示 %>
      <% if @role == 200 %>
        <button class="edit-charinfo-btn", data-target="edit-secret${data.secret.num}-${data.content.secret_n}">編集</button>
        <%= render "secrets/edit_secret", num: num, token: @room.token, selected_char: selected_char, s: s %>
      <% end %>
      <%# 秘密編集モーダル表示 %>
    </div>
  <% end %>
  `;

    $('.wrap-char-form').fadeOut(200);
    $(`#secrets-${data.secret.num}`).append(
      `${HTML}`
    );
    $('.js-message-errors').empty();

    $('.form-background').on('click', function() {
      $('.wrap-char-form').fadeOut(300);
      return false;
    });
    $('.edit-charinfo-btn').each(function() {
      $(this).on('click', function() {
        const target = $(this).data('target');
        const modal = document.getElementById(target);
        $(modal).fadeIn(300);
        return false;
      });
    });
  }
});
