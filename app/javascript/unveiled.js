function unveil() {
  // 秘密の公開非公開切り替え
  $('.secret_unveil_box').each(function() {
    if ($(this).data('load') != null) {
      return null;
    };
    this.setAttribute('data-load', 'true');
    $(this).on('click', function(){
      const openSecretId = $(this).data('id');
      const token = $(this).data('token');
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/rooms/${token}/open_secrets/${openSecretId}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        };
        const item = XHR.response.open_secret;
        const unveil = XHR.response.unveil;
        if (item.unveiled_id == 1) {
          this.innerHTML = unveil;
        } else if (item.unveiled_id == 2) {
          this.innerHTML = unveil;
        };
      };
    });
  });
  // 秘密の公開非公開切り替え

  // 奥義の公開非公開切り替え
  $('.lr_unveil_box').each(function() {
    if ($(this).data('load') != null) {
      return null;
    };
    this.setAttribute('data-load', 'true');
    $(this).on('click', function(){
      const openLastResortId = $(this).data('id');
      const token = $(this).data('token');
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/rooms/${token}/open_last_resorts/${openLastResortId}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        };
        const item = XHR.response.open_last_resort;
        const unveil = XHR.response.unveil;
        if (item.unveiled_id == 1) {
          this.innerHTML = unveil;
        } else if (item.unveiled_id == 2) {
          this.innerHTML = unveil;
        };
      };
    });
  });
  // 奥義の公開非公開切り替え

  $('.unveiled').each(function() {
    $(this).on('click', function() {
      const target = $(this).data('target');
      const modal = document.getElementById(target);
      $(modal).fadeIn(300);
      return false;
    });
  });
};

setInterval(unveil, 1000);