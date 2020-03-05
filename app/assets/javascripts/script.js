$(function() {
  $('.main__show__content__top__itemInfo__image__ul__li__top').eq(0).addClass('active');

  $('.main__show__content__top__itemInfo__image__ul__li').click(function() {

    $('.active').removeClass('active');
    var clickedIndex = $('.main__show__content__top__itemInfo__image__ul__li').index($(this));
    console.log(clickedIndex);
    $('.main__show__content__top__itemInfo__image__ul__li__top').eq(clickedIndex).addClass('active');
  });
});


