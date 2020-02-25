// ナビリストに関する記述
$(function(){
  $ ('.mypage__flex__left__list').mouseover(function(){
    var list = $(this).data('mypage');
    $('.mypage-icon' + list).css('right', 10);
    $('.mypage-icon' + list).css('opacity', 1);
    $(this).css('background','whitesmoke');
    return false;
  });
});

$(function(){
  $ ('.mypage__flex__left__list').mouseleave(function(){
    var list = $(this).data('mypage');
    $('.mypage-icon' + list).animate({right: 20},{duration: '2000'});
    $('.mypage-icon' + list).css('opacity', 0.5);
    $(this).css('background','');
    return false;
  });
});

// ナビリストで、現在ページの色を変える記述
$(function(){
  $('.mypage__flex__left__list a').each(function(){
    var $href = $(this).attr('href');
    if(location.href.match($href)) {
      $(this).parent().addClass('current-page');
    } else {
      $(this).parent().removeClass('current-page');
    }
  });
});


// タブに関する記述
$(function(){
  $ ('#mypage-tab-2').click(function(){
    $(this).css('background', 'white');
    $(this).css('border', 'none');
    $('#mypage-tab-1').css('background','whitesmoke');
    $('#mypage-tab-1').css('border-top','whitesmoke');
    $('#mypage-tab-2').css('border-top','2px solid red');
    return false;
  });
});

$(function(){
  $ ('#mypage-tab-1').click(function(){
    $(this).css('background', 'white');
    $(this).css('border', 'none');
    $('#mypage-tab-2').css('background','whitesmoke');
    $('#mypage-tab-2').css('border-top','whitesmoke');
    $('#mypage-tab-1').css('border-top','2px solid red');
    return false;
  });
});

$(function(){
  $ ('#mypage-tab-4').click(function(){
    $(this).css('background', 'white');
    $(this).css('border', 'none');
    $('#mypage-tab-3').css('background','whitesmoke');
    $('#mypage-tab-3').css('border-top','whitesmoke');
    $('#mypage-tab-4').css('border-top','2px solid red');
    return false;
  });
});

$(function(){
  $ ('#mypage-tab-3').click(function(){
    $(this).css('background', 'white');
    $(this).css('border', 'none');
    $('#mypage-tab-4').css('background','whitesmoke');
    $('#mypage-tab-4').css('border-top','whitesmoke');
    $('#mypage-tab-3').css('border-top','2px solid red');
    return false;
  });
});