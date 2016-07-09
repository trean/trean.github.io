$(function () {
  $.fn.setEqualHeight = function () {
    var $this = $(this);
    var tallestcolumn = 0;
    $this.each(
        function() {
          var currentHeight = $(this).height();
          if(currentHeight > tallestcolumn) {
            tallestcolumn = currentHeight;
          }
        });
    $this.height(tallestcolumn);
  };

  function posFuter () {
    var bodyHeight = $('body').height(),
    viewHeight = $(window).height(),
    headerHeight = $('.header').innerHeight();
    head1Height = $('.head1').innerHeight(),
    footerHeight = $('.footer').innerHeight();

    if (bodyHeight < viewHeight) {
      $('.main-articles').css({'height' : (viewHeight - (headerHeight + head1Height + footerHeight)) });
    }
  }

 $.fn.actMenuItem = function () {
    var topMenuItem = $(this);
    topMenuItem.each(function(index, el) {
      var menuItemHref = $(this).attr('href');
      if ((window.location.href.indexOf(menuItemHref) > -1) && menuItemHref != '/') {
        $(this).parent().addClass('act');
      } else if (window.location.pathname === '/') {
        topMenuItem.first().parent().addClass('act');
      } 
    });
 };

  // $('.slider-at-mine').owlCarousel({
  // items:1,
  // loop:true,
  // nav:false,
  // autoplay:true
  // });

  // $(".portfolio__carousel").owlCarousel({
  // items:3,
  // loop:true,
  // nav:true,
  // margin: 20
  // });
  $(document).ready(function () {

    posFuter();

    $(".fancybox").fancybox({
      openEffect  : 'none',
      closeEffect : 'none'
    });

    $(".card").setEqualHeight();
    var slideout = new Slideout({
      'panel': document.getElementById('panel'),
      'menu': document.getElementById('menu'),
      'padding': 256,
      'tolerance': 70
    });

    // Toggle button
    document.querySelector('.mobile-btn').addEventListener('click', function() {
      slideout.toggle();
    });

     $(".top-menu > li > a").actMenuItem();
     $(".mobile-menu__item > a").actMenuItem();
  }); 
});      


