$(function() {

  $(".rateYo").rateYo({
    halfStar: true,
    multiColor: {
      "startColor": "#FF0000", //RED
      "endColor"  : "#00FF00"  //GREEN
    }
  });

  $('svg').on('click', function(){
     var width = $(this).parent();
     console.log(parseInt(width.css('width')));
   });

   $('svg').on('click', function(){
     var width = $(this).parent();
     console.log(width);
     var ratingNumber = parseInt(width.css('width'))/16/2;
     console.log(ratingNumber);

     $('#review_rating').val(ratingNumber);
     $('#set-rating').val(ratingNumber);
    //  $.ajax({
    //    url: $(this).attr('action'),
    //    method: $(this).attr('method'),
    //    data: {rating: ratingNumber},
    //    dataType: 'JSON'
    //  });

   });
   $('.stars').each(function(index){
     // console.log(index + ':' + $(this).text() );
     // console.log(index + ':' + $(this).data('rating') )
     $(this).rateYo(
       "option", "rating", $(this).data('rating')
     )

     $(this).rateYo(
       "option", "readOnly", true)

   });

   $('.stars-readonly').each(function(index){
     $(this).rateYo("option", "readOnly", true);

     $(this).rateYo(
       "option", "rating", $(this).data('rating')
     )
   });

});
// 'input[name=rating]'
