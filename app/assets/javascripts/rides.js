$(function() {
  $(".rateYo").rateYo({
    rating: 0,
    halfStar: true,
    multiColor: {
      "startColor": "#FF0000", //RED
      "endColor"  : "#00FF00"  //GREEN
    }
  });

  $('svg').on('click', function(){
    var width = $(this).parent();
    console.log(parseInt(width.css('width')))
  });
});
// 'input[name=rating]'
