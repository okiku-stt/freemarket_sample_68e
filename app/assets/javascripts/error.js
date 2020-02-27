window.addEventListener("load", function(){
  $(function(){
    $( '.error-item-name' ).on('blur', function(){
      let name = $(this).val();
      if(name == 0){
        $('.error-item-name').css('border-color','red')
        $('.must-message__item-name').text('入力してください')
      }else{
        $('.error-item-name').css('border-color','')
        $('.must-message__item-name').text('')
      }
    });
    $( '.error-item-name' ).on('change',function(){
      let name = $(this).val();
      if(name == 0){
        $('.error-item-name').css('border-color','red')
        $('.must-message__item-name').text('入力してください')
      }else{
        $('.error-item-name').css('border-color','')
        $('.must-message__item__name').text('')
      }
    });
    $('.error-item-description').on('blur',function(){
      let description = $(this).val();
      if(description == 0){
        $('.error-item-description').css('border-color','red')
        $('.must-message__item-description').text('入力してください')
      }else{
        $('error-item-description').css('border-color','')
        $('.must-message__item-description').text('')
      }
    });
    $('.error-item-description').on('change',function(){
      let description = $(this).val();
      if(description == 0){
        $('.error-item-description').css('border-color','red')
        $('.must-message__item-description').text('入力してください')
      }else{
        $('.error-item-description').css('border-color','')
        $('.must-message__item-description').text('')
      }
    });
    
    $('.error-category').on('blur',function(){
      let status = $(this).val();
      if(status == "選択してください"){
        $('.error-category').css('border-color','red')
        $('.must-message__category').text('必須項目です')
      }else{
        $('.error-category').css('border-color','')
        $('.must-message__category').text('')
      }
    });
    $('.error-category').on('change',function(){
      let status = $(this).val();
      if(status == "選択してください"){
        $('.error-category').css('border-color','red')
        $('.must-message__category').text('必須項目です')
      }else{
        $('.error-category').css('border-color','')
        $('.must-message__category').text('')
      }
    });
    
    $('.error-status').on('blur',function(){
      let status = $(this).val();
      if(status == "選択してください"){
        $('.error-status').css('border-color','red')
        $('.must-message__status').text('必須項目です')
      }else{
        $('.error-status').css('border-color','')
        $('.must-message__status').text('')
      }
    });
    $('.error-status').on('change',function(){
      let status = $(this).val();
      if(status == "選択してください"){
        $('.error-status').css('border-color','red')
        $('.must-message__status').text('必須項目です')
      }else{
        $('.error-status').css('border-color','')
        $('.must-message__status').text('')
      }
    });
    
    $('.error-shipping-charge').on('blur',function(){
      let status = $(this).val();
      if(status == "選択してください"){
        $('.error-shipping-charge').css('border-color','red')
        $('.must-message__shipping-charge').text('必須項目です')
      }else{
        $('.error-shipping-charge').css('border-color','')
        $('.must-message__shipping-charge').text('')
      }
    });
    $('.error-shipping-charge').on('change',function(){
      let status = $(this).val();
      if(status == "選択してください"){
        $('.error-shipping-charge').css('border-color','red')
        $('.must-message__shipping-charge').text('必須項目です')
      }else{
        $('.error-shipping-charge').css('border-color','')
        $('.must-message__shipping-charge').text('')
      }
    });
    
    $('.error-shipping-area').on('blur',function(){
      let status = $(this).val();
      if(status == ""){
        $('.error-shipping-area').css('border-color','red')
        $('.must-message__shipping-area').text('必須項目です')
      }else{
        $('.error-shipping-area').css('border-color','')
        $('.must-message__shipping-area').text('')
      }
    });
    $('.error-shipping-area').on('change',function(){
      let status = $(this).val();
      if(status == "" ){
        $('.error-shipping-area').css('border-color','red')
        $('.must-message__shipping-area').text('必須項目です')
      }else{
        $('.error-shipping-area').css('border-color','')
        $('.must-message__shipping-area').text('')
      }
    });
    
    $('.error-shipping-date').on('blur',function(){
      let status = $(this).val();
      if(status == "選択してください"){
        $('.error-shipping-date').css('border-color','red')
        $('.must-message__shipping-date').text('必須項目です')
      }else{
        $('.error-shipping-date').css('border-color','')
        $('.must-message__shipping-date').text('')
      }
    });
    $('.error-shipping-date').on('change',function(){
      let status = $(this).val();
      if(status == "選択してください"){
        $('.error-shipping-date').css('border-color','red')
        $('.must-message__shipping-date').text('必須項目です')
      }else{
        $('.error-shipping-date').css('border-color','')
        $('.must-message__shipping-date').text('')
      }
    });

    $( '.error-price' ).on('blur', function(){
      let price = $(this).val();
      if( price == 0){
        $('.error-price').css('border-color','red')
        $('.must-message__price').text('300以上9999999以下で入力してください')
      }else{
        $('.error-price').css('border-color','')
        $('.must-message__price').text('')
      }
    });
    $( '.error-price' ).on('change',function(){
      let price = $(this).val();
      if( price == 0){
        $('.error-price').css('border-color','red')
        $('.must-message__price').text('300以上9999999以下で入力してください')
      }else{
        $('.error-price').css('border-color','')
        $('.must-message__price').text('')
      }
    });
  });
});