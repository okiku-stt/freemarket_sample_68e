window.addEventListener('load', function() {
  $(function(){
    $( '#user_email' ).on('blur', function(){
      let name = $(this).val();
      if(name == 0){
        $('#user_email').css('border-color','red')
        $('.must__email').text('入力してください')
      }else{
        $('#user_email').css('border-color','')
        $('.must__email').text('')
      }
    });
    $( '#user_password' ).on('blur', function(){
      let name = $(this).val();
      if(name == 0){
        $('#user_password').css('border-color','red')
        $('.must__message__password').text('入力してください')
      }else{
        $('#user_password').css('border-color','')
        $('.must__message__password').text('')
      }
    });
  });
});