const charForm = $(() => {
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
  })
});

window.addEventListener('load', charForm);