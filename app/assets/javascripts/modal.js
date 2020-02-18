document.addEventListener(
  "DOMContentLoaded", e => {
    let modal_open = document.getElementById("buy-button");
    modal_open.onclick = function (e) {
      e.preventDefault(); 
      $('#buy-overlay').fadeIn();
      document.getElementById('buy-modal-close-btn').onclick = function () {
        $('#buy-overlay').fadeOut();
      };
      document.getElementById("purchase-comformation-btn").onclick = function (e) {
        e.preventDefault(); 
        document.getElementById("item-purchase-btn").click();
      };
    };
  },
  false
);