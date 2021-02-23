const charForm = $(() => {
  // PC情報入力ボタンクリック時
  $('.input_char_info').each(function() {
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
  // PC情報入力ボタンクリック時

  // PC情報編集ボタンクリック時
  $('.char-edit-btn').each(function() {
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
  // PC情報編集ボタンクリック時

  $('.add-btn').on('click', function() {
    $('hidden-error').css({ display: inline-block });
  });

  // 変調追加ボタンクリック時
  $('.condition_click_frame').each(function() {
    $(this).on('click', function() {
      const target = $(this).data('target');
      const modal = document.getElementById(target);
      $(modal).fadeIn(300);
      return false;
    });
  });

  // 感情追加ボタンクリック時
  // 感情追加ボタンクリック時
});

window.addEventListener('load', charForm);