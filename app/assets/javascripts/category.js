//「カテゴリーから探す」についての記述
$(function(){
  //「子のカテゴリー」に関するHTMLを生成
  var buildHTML = function(child) {
    var html =
      `<a class="top__header__item__type__category__wrapper__flex__children__item" href="#">
        <div class="top__header__item__type__category__wrapper__flex__children__item__text" data-item-id=${child.id}>
          ${child.item}
        </div>
      </a>`
    return html;
  }

  //「孫のカテゴリー」に関するHTMLを生成
  var buildHTML_grandchildren = function(grandchild) {
    var html =
      `<a class="top__header__item__type__category__wrapper__flex__grandchildren__item" href="#">
        <div class="top__header__item__type__category__wrapper__flex__grandchildren__item__text" data-item-id=${grandchild.id}>
          ${grandchild.item}
        </div>
      </a>`
    return html;
  }

  //「親のカテゴリー」をマウスオーバーした時の記述
  // 子の表示
  $('.top__header__item__type__category__wrapper__flex__parents__item__text').mouseover(function(){
    // 選択箇所が分かるように色を変える
    $('.top__header__item__type__category__wrapper__flex__parents__item__text').css({'background': '', 'color': 'dimgray'});
    $(this).css({'background': 'turquoise', 'color': 'white'});
    // 孫の枠を非表示
    $('.top__header__item__type__category__wrapper__flex__grandchildren').css('box-shadow', '');
    $('.top__header__item__type__category__wrapper__flex__grandchildren').css('background', '');
    var id = $(this).data('item-id');
    $.ajax({
      url: "/categories/search_children",
      type: "GET",
      data: {
        parent_id: id
      },
      dataType: 'json'
    })
    .done(function(data){
      $('.top__header__item__type__category__wrapper__flex__children__item').remove(); //「子のカテゴリー」を削除（2重表記を防ぐ）
      $('.top__header__item__type__category__wrapper__flex__grandchildren__item').remove(); //「孫のカテゴリー」を削除
      if (data.length !== 0) {
        var insertHTML = '';
        $.each(data, function(i, child) {
          insertHTML += buildHTML(child)
        });
        var parents = $('a.category__wrapper__flex__parents__item')
        // 'flag'クラスが存在するなら子を追加
        // 'flag'クラスを設けることでajaxのタイムラグによる表示エラーを防ぐ
        if ($('.flag').length) {
          $('.top__header__item__type__category__wrapper__flex__children').append(insertHTML);
          $('.top__header__item__type__category__wrapper__flex__children').css('box-shadow', '0 0 1px dimgray'); // 枠を表示
          $('.top__header__item__type__category__wrapper__flex__children').css('background', 'white');
        }
      }
    })
    .fail(function() {
      alert('error');
    });
  });

  //「子のカテゴリー」をマウスオーバーした時の記述（JSで生成された要素なので記述に注意）
  // 孫の表示
  $('.top__header__item__type__category__wrapper__flex__children').on("mouseover", ".top__header__item__type__category__wrapper__flex__children__item__text", function(){
    // 選択箇所が分かるように色を変える
    $('.top__header__item__type__category__wrapper__flex__children__item__text').css({'background': '', 'color': 'dimgray'});
    $(this).css('background', 'whitesmoke');
    var id_child = $(this).data('item-id');
    $.ajax({
      url: "/categories/search_grandchildren",
      type: "GET",
      data: {
        child_id: id_child
      },
      dataType: 'json'
    })
    .done(function(data){
      $('.top__header__item__type__category__wrapper__flex__grandchildren__item').remove(); //「孫のカテゴリー」を削除（2重表記を防ぐ）
      if (data.length !== 0) {
        var insertHTML = '';
        $.each(data, function(i, grandchild) {
          insertHTML += buildHTML_grandchildren(grandchild)
        });
        $('.top__header__item__type__category__wrapper__flex__grandchildren').append(insertHTML);
        $('.top__header__item__type__category__wrapper__flex__grandchildren').css('box-shadow', '0 0 1px dimgray'); // 枠を表示
        $('.top__header__item__type__category__wrapper__flex__grandchildren').css('background', 'white');
      }
    })
    .fail(function() {
      alert('error');
    });
  });

  //「孫のカテゴリー」をマウスオーバーした時の記述（JSで生成された要素なので記述に注意）
  $('.top__header__item__type__category__wrapper__flex__grandchildren').on("mouseover", ".top__header__item__type__category__wrapper__flex__grandchildren__item__text", function(){
    // 選択箇所が分かるように色を変える
    $('.top__header__item__type__category__wrapper__flex__grandchildren__item__text').css({'background': '', 'color': 'dimgray'});
    $(this).css('background', 'whitesmoke');
  });

  //「カテゴリーから探す」をマウスオーバーした時の記述
  // 親の表示
  $('.top__header__item__type__category__wrapper__target').mouseover(function(){
    // 子をappendする際の条件分岐に使用
    $('.top__header__item__type__category__wrapper__flex').prepend(`<div class="flag"></div>`)
    // 親の表示
    $('.top__header__item__type__category__wrapper__flex__parents__item').css('display', 'block');
    $('.top__header__item__type__category__wrapper__flex__parents').css('box-shadow', '0 0 1px dimgray');
    $('.top__header__item__type__category__wrapper__flex__parents').css('background', 'white');
    // 子と孫を削除
    $('.top__header__item__type__category__wrapper__flex__children__item').remove();
    $('.top__header__item__type__category__wrapper__flex__children').css('box-shadow', '');
    $('.top__header__item__type__category__wrapper__flex__children').css('background', '');
    $('.top__header__item__type__category__wrapper__flex__grandchildren__item').remove();
    $('.top__header__item__type__category__wrapper__flex__grandchildren').css('box-shadow', '');
    $('.top__header__item__type__category__wrapper__flex__grandchildren').css('background', '');
  });

  // 親・子・孫を包むラッパーからマウスリーブした時の記述
  $('.top__header__item__type__category__wrapper').mouseleave(function(){
    // ajax処理が遅れて、子要素が帰って来ても'flag'がない為、appendできない
    $('.flag').remove();
    // 親を非表示に戻し、子と孫を削除
    $('.top__header__item__type__category__wrapper__flex__parents__item').css('display', 'none');
    $('.top__header__item__type__category__wrapper__flex__children__item').remove();
    $('.top__header__item__type__category__wrapper__flex__grandchildren__item').remove();
  });
});

//「ブランドから探す」についての記述
$(function(){
  $('.top__header__item__type__brand__target').mouseover(function(){
    $('.top__header__item__type__brand__navi').css({'display': 'block', 'box-shadow': '0 0 1px dimgray'});
  });
  $('.top__header__item__type__brand').mouseleave(function(){
    $('.top__header__item__type__brand__navi').css('display', 'none');
  });
  $('.top__header__item__type__brand__navi__item__text').mouseover(function(){
    $('.top__header__item__type__brand__navi__item__text').css({'background': '', 'color': 'dimgray'});
    $(this).css({'background': 'turquoise', 'color': 'white'})
  });
});