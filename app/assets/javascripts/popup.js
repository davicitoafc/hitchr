$(function() {
  //----- OPEN
  $('[data-popup-open]').on('click', function(e)  {
    $('.popup').fadeOut(350);
      var targeted_popup_class = $(this).attr('data-popup-open');
      $('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);

      e.preventDefault();
  });

  //----- CLOSE
  $('[data-popup-close]').on('click', function(e)  {
      var targeted_popup_class = $(this).attr('data-popup-close');
      $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);

      e.preventDefault();
  });

  $('.popup-inner').on('click', function(e) {
    e.stopPropagation();
  });

  $('input').on('click', function(e) {
    e.stopPropagation();
  });

  $('.popup').on('click', function(e) {
    e.stopPropagation();
    $(this).fadeOut();
  });
});
