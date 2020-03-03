$(document).ready(function(){
  var images = [];
  var inputs  =[];
  var input_area = $('.input_area');
  var dropzone = $('.dropzone-area');
  var dropzone2 = $('.dropzone-area2');
  var preview = $('#preview');
  var preview2 = $('#preview2');

  $(document).on('change', 'input[type= "file"].upload-image',function(e) {
    // 選択したファイル情報を取得し変数に格納
    // filesプロパティの最初のファイルをpropで取得
    var file = $(this).prop('files')[0];
    // ファイルを読むオブジェクトFileReaderをインスタンス化
    var reader = new FileReader();
    // thisを配列に追加
    inputs.push($(this));
    var img = $(`<div class= "img_view" data-image= ${(images.length)}><img></div>`);
    // 読み込み完了時にイベント発火
    reader.onload = function(e) {
      var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>');
      img.append(btn_wrapper);
      // 変数imgの<img>をFileReaderオブジェクトのresultプロパティにある読み込み結果をsrcに置き換える
      img.find('img').attr({
        src: e.target.result
      })
    }
    // 画像の読み込み（DataURLは、http:からでなく、data:から始まる特殊なURL）
    // file = filesプロパティの最初のファイル
    $('.must-message__image').hide();
    reader.readAsDataURL(file);
    // imgを配列に追加
    images.push(img);
    
    if (images.length > 0) {
      dropzone.find('p').replaceWith('');
      dropzone.find('i').css('top', '50%');
    }
    if (images.length <= 4) {
      // #previewの子要素を削除（removeはそのものの削除）
      $('#preview').empty();
      $.each(images, function(index, image) {
        // form.fields_forの|image|より
        // 各imageのカスタムデータ属性'image'を'data-image': index番号 とする
        image.data('image', index);
        preview.append(image);
      })
      dropzone.css('width', `calc(100% - (20% * ${images.length}))`);
    } else if (images.length == 5) {
      $('#preview').empty();
      $.each(images, function(index, image) {
        image.data("image", index);
        preview.append(image);
      });
      dropzone.css('display', 'none');
      dropzone2.css('display', 'block'); 
      preview2.empty();
    } else if (images.length >= 6) {
      // １〜５枚目の画像を抽出（配列番号０から５未満を選択）
      var pickup_images1 = images.slice(0,5);
      // １〜５枚目を１段目に表示
      $('#preview').empty();
      $.each(pickup_images1, function(index, image) {
        image.data('image', index);
        preview.append(image);
      })
      // ６枚目以降の画像を抽出（配列番号５以降を選択）
      var pickup_images2 = images.slice(5);
      // ６枚目以降を２段目に表示
      $.each(pickup_images2, function(index, image) {
        image.data('image', index + 5);
        preview2.append(image);
      })
      dropzone.css('display', 'none')
      dropzone2.css({
        'display': 'block',
        'width': `calc(100% - (20% * ${images.length - 5}))`
      })
      if (images.length == 10) {
        dropzone2.css('display', 'none');
      }
    }
    // 画像がアップされるごとにデータ属性が異なるinputタグを生成
    var new_image = $(`<input multiple= "multiple" name="exhibition_images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
    input_area.prepend(new_image);
  });

  $(document).on('click', '.delete', function() {
    var target_image = $(this).parent().parent();
    $.each(inputs, function(index, input){
      if ($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove();
        var num = $(this).data('image');
        // 配列imagesよりnum番目から1つの要素を削除
        images.splice(num, 1);
        inputs.splice(num, 1);
        if (inputs.length == 0) {
          $('input[type= "file"].upload-image').attr({
          })
        }
      }
    })
    // 削除後、残りのうち最初の画像のデータ型を配列の番号に置き換える
    // 105行目でprependしてるので、最後の投稿が最初となる
    $('input[type= "file"].upload-image:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"].upload-image:first').after(input)
    })
    if (images.length >= 5) {
      dropzone2.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
      })
      dropzone2.css({
        'width': `calc(100% - (135px * ${images.length - 5}))`
      })
    } else {
      dropzone.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index + 1);
        preview.append(image);
      })
      dropzone.css({
        'width': `calc(100% - (135px * ${images.length}))`
      })
    }
    if (images.length == 4) {
      dropzone2.css({
        'display': 'none'
      })
    }
  })
});
