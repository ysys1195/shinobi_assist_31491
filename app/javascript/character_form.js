const charForm = $(() => {
  // PC情報入力ボタン / PC情報編集ボタン/ 感情と変調の追加ボタン のクリック時
  $('.input_char_info, .char-edit-btn, .click_frame').each(function() {
    $(this).on('click', function() {
      const target = $(this).data('target');
      const modal = document.getElementById(target);
      $(modal).fadeIn(300);
      return false;
    });
  });
  $('.form-background').on('click', function() {
    $('.wrap-char-form').fadeOut(300);
    return false;
  });
  // PC情報入力ボタン / PC情報編集ボタン/ 感情と変調の追加ボタン のクリック時

  // エラー表示
  $('.add-btn').each(function() {
    $(this).on('click', function() {
      const target = $(this).data('target');
      const hiddenError = document.getElementById(target);
      $(hiddenError).css({ display: 'inline-block' });
    });
  });
  // エラー表示

  // マウスオーバー時
  $('.status_over_frame, .status_over_frame2').each(function() {
    $(this).on('mouseover', function() {
      const target = $(this).data('target');
      const mouseOver = document.getElementById(target);
      $(mouseOver).css({ display: 'inline-block' });
    });
    $(this).on('mouseout', function() {
      const target = $(this).data('target');
      const mouseOut = document.getElementById(target);
      $(mouseOut).css({ display: '' });
    });
  });
  // マウスオーバー時
});

window.addEventListener('load', charForm);