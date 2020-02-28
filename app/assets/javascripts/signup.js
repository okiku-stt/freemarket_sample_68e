window.addEventListener('load', function() {
  $(function(){
    $('#user_nickname').on('blur', function(){
      let name = $(this).val();
      if(name == 0){
        $('#user_nickname').css('border-color','red')
        $('.must__nickname').text('入力してください')
      }else{
        $('#user_nickname').css('border-color','')
        $('.must__nickname').text('')
      }
    }); 
    $( '#user_email').on('blur', function(){
      let name = $(this).val();
      if(name == 0){
        $('#user_email').css('border-color','red')
        $('.must__email').text('入力してください')
      }else{
        $('#user_email').css('border-color','')
        $('.must__email').text('')
      }
    });
    $('#user_password').on('blur', function(){
      let name = $(this).val();
      if(name == 0){
        $('#user_password').css('border-color','red')
        $('.must__password').text('入力してください')
      }else{
        $('#user_password').css('border-color','')
        $('.must__password').text('')
      }
    });
    $('#user_password_confirmation').on('blur', function(){
      let name = $(this).val();
      if(name == 0){
        $('#user_password_confirmation').css('border-color','red')
        $('.must__confirmation').text('入力してください')
      }else{
        $('#user_password_confirmation').css('border-color','')
        $('.must__confirmation').text('')
      }
    });
    $('#user_family_name, #user_last_name').on('blur', function(){
      let name = $(this).val();
      if(name == 0){
        $('#user_family_name, #user_last_name').css('border-color','red')
        $('.must__name').text('入力してください')
      }else{
        $('#user_family_name, #user_last_name').css('border-color','')
        $('.must__name').text('')
      }
    });
    $('#user_j_family_name, #user_j_last_name').on('blur', function(){
      let name = $(this).val();
      if(name == 0){
        $('#user_j_family_name, #user_j_last_name').css('border-color','red')
        $('.must__kana').text('入力してください')
      }else{
        $('#user_j_family_name, #user_j_last_name').css('border-color','')
        $('.must__kana').text('')
      }
    });
    $('#user_address_attributes_ship_family_name, #user_address_attributes_ship_last_name').on('blur', function(){
      let name = $(this).val();
      if(name == 0){
        $('#user_address_attributes_ship_family_name, #user_address_attributes_ship_last_name').css('border-color','red')
        $('.must__send').text('入力してください')
      }else{
        $('#user_address_attributes_ship_family_name, #user_address_attributes_ship_last_name').css('border-color','')
        $('.must__send').text('')
      }
    });
    $('#user_address_attributes_ship_j_family_name, #user_address_attributes_ship_j_last_name').on('blur', function(){
      let name = $(this).val();
      if(name == 0){
        $('#user_address_attributes_ship_j_family_name, #user_address_attributes_ship_j_last_name').css('border-color','red')
        $('.must__send__kana').text('入力してください')
      }else{
        $('#user_address_attributes_ship_j_family_name, #user_address_attributes_ship_j_last_name').css('border-color','')
        $('.must__send__kana').text('')
      }
    });
    $('#user_address_attributes_postal_code').on('blur', function(){
      let name = $(this).val();
      if(name == 0){
        $('#user_address_attributes_postal_code').css('border-color','red')
        $('.must__postal__code').text('入力してください')
      }else{
        $('#user_address_attributes_postal_code').css('border-color','')
        $('.must__postal__code').text('')
      }
    });
    $('#user_address_attributes_prefectures').on('blur', function(){
      let name = $(this).val();
      if(name == 0){
        $('#user_address_attributes_prefectures').css('border-color','red')
        $('.must__prefectures').text('入力してください')
      }else{
        $('#user_address_attributes_postal_code').css('border-color','')
        $('.must__prefectures').text('')
      }
    });
    $('#user_address_attributes_municipalities').on('blur', function(){
      let name = $(this).val();
      if(name == 0){
        $('#user_address_attributes_municipalities').css('border-color','red')
        $('.must__municipalities').text('入力してください')
      }else{
        $('#user_address_attributes_municipalities').css('border-color','')
        $('.must__municipalities').text('')
      }
    });
    $('#user_address_attributes_house_number').on('blur', function(){
      let name = $(this).val();
      if(name == 0){
        $('#user_address_attributes_house_number').css('border-color','red')
        $('.must__house_number').text('入力してください')
      }else{
        $('#user_address_attributes_municipalities').css('border-color','')
        $('..must__house_number').text('')
      }
    });
  });
});