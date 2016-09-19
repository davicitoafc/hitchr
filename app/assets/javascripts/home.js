$(document).ready(function() {

// For parallax on homepage
    $('.parallax-window').parallax({
    naturalWidth: 600,
    naturalHeight: 400
    });

// For background Video on homepage
    $('#my-video').backgroundVideo({
      $videoWrap: $('#video-wrap'),
      $outerWrap: $('#outer-wrap'),
      preventContextMenu: true,
      pauseVideoOnViewLoss: true,
      parallaxOptions: {
          offset: 60,
          effect: 3
      }
    });


// Change background of nav on scroll
    $(window).scroll(function() { // check if scroll event happened
         if ($(document).scrollTop() > 50) { // check if user scrolled more than 50 from top of the browser window
           $(".navbar-fixed-top").css("background-color", "rgba(0, 0, 0, 0.4)"); // if yes, then change the color of class "navbar-fixed-top" to white (#f8f8f8)
         } else {
           $(".navbar-fixed-top").css("background-color", "transparent"); // if not, change it back to transparent
         }
       });

// change background color on hamburger click
    $('.navbar-toggle').on('click', function(){
      $(".navbar-fixed-top").toggleClass('alt-color');
    });




// For search button, on click scroll down to div containing searches
    $('.search-button').on('click', function (){
      $('.placeholder-info').hide();
      $('html, body').animate({
        scrollTop: $('#content_2').offset().top }, 1000);
      });


});
