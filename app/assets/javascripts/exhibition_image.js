$(document).ready(function(){
// imgタグの生成
const buildImg = (index, url)=> {
  const html = `<div data-index="${index}" class="image-wrapper">
  <img data-index="${index}" src="${url}">
  <div class="file-remove">削除</div>                    
  </div>
  <input class="hidden" data-index="${index}" type="checkbox" value="1" name="exhibition[images_attributes][${index}][_destroy]" id="exhibition_images_attributes_${index}__destroy">
  `;
  return html;
}
// inputタグの生成（次の投稿の為）
const buildFileField = (num)=> {
  const html = `<label class="upload-area" for="exhibition_images_attributes_${num}_image">
  <i class="fas fa-camera-retro" id="camera"></i>
  <div data-index="${num}" class="file-group">
  <input class="upload-file hidden" type="file" name="exhibition[images_attributes][${num}][image]" id="exhibition_images_attributes_${num}_image">
  </div>
  </label>`;
  return html;
}

let fileIndex = [1,2,3,4,5,6,7,8,9,10];
lastIndex = $('.file-group:last').data('index');
// splice(x, y) → x番目からyつの要素を削除
// 1枚目をアップ(元々あるinputタグを使用/file-groupのデータ属性indexの番号は0)
// → 0番目から0つの要素を削除([1,2,3,4,5,6,7,8,9,10])
// 2枚目をアップ → 0番目から1つの要素を削除([2,3,4,5,6,7,8,9,10])
fileIndex.splice(0, lastIndex);
// upload-fileクラスに変化が起きたらイベント発火（ファイルが選択されたら）

$('#previews').on('change', '.upload-file', function(e) {
  const targetIndex = $(this).parent().data('index');
  const file = e.target.files[0];
  const blobUrl = window.URL.createObjectURL(file);
  // 画像のプレビューと画像をアップするためのinputタグを生成
  var images = $('.image-wrapper').length
  if (images < 5 ) {
    $('#upper-row').append(buildImg(targetIndex, blobUrl));
  } else {
    $('#lower-row').append(buildImg(targetIndex, blobUrl));
  }
  
  // spliceしたfileIndexの最初の番号を引数として渡す（1枚目の場合"1"）
    $('#image-input').append(buildFileField(fileIndex[0]));

    // 発火させたinputタグとラベルを非表示
    $(this).parent().parent().css('display', 'none');
    $(`#exhibition_images_attributes_${fileIndex[0]}_image`).css('display', 'none');

    // fileIndexの最初の要素を削除
    // 1枚目の場合[2,3,4,5,6,7,8,9,10]
    fileIndex.shift();
    // fileIndexの最後に要素を追加
    // 1枚目の場合 fileIndex(9-1)→fileIndex(8)→配列は0始まりなので、0が2、8が10
    // 10 + 1 = 11 となり、11を追加([2,3,4,5,6,7,8,9,10,11])
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
  });

  // ラベルの大きさに関する記述
  $(document).on('change', '.upload-area', function(){
    var images = $('.image-wrapper').length
    if (images < 5 ) {
      $('.upload-area').css({'width': `calc(600px - (120px * ${images}))`})
    } else if (images == 5 ) {
      $('.upload-area').css({'height': '200px', 'width': '600px'});
    } else if (images < 10 ) {
      $('.upload-area').css({'width': `calc(600px - (120px * ${images - 5}))`})
    } else { (images == 10 ) 
      $('.upload-area').css('display', 'none')
    }
  });

  // 削除した際の記述
  $('#previews').on('click', '.file-remove', function() {
    const targetIndex = $(this).parent().data('index');

    // editページでのみ使用（「削除」と「checkbox」の連携）
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    // newページのみ使用
    // imgタグの削除（ビュー上での表示を消す）
    $(this).parent().remove();
    // inputタグの削除（コントローラーに渡さないようにする）
    const input_remove = $(`div[data-index="${targetIndex}"].file-group`)[0];
    input_remove.remove();
    // ここまで

    var images = $('.image-wrapper').length
    if (images < 5 ) {
      $('.upload-area').css({'width': `calc(600px - (120px * ${images}))`})
    } else if (images == 4 ) {
      $('.upload-area').css({'display': 'block', 'width': `120px`});
    } else if (images == 5 ) {
      $('.upload-area').css({'height': '200px', 'width': '600px'});
    } else if (images < 9 ) {
      $('.upload-area').css({'width': `calc(600px - (120px * ${images - 5}))`})
    } else { (images == 9 ) 
      $('.upload-area:last').css({'display': 'block', 'width': `120px`})
    }
  });
  if ($('.upload-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
});

