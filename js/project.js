
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

function activMenuItem () {
  var topMenuItem = $('.top-menu > ul > li > a');
  topMenuItem.each(function(index, el) {
    var menuItemHref = $(this).attr('href');
    if ((window.location.href.indexOf(menuItemHref) > -1) && menuItemHref != '/') {
      $(this).addClass('act');
    } else if (window.location.pathname === '/') {
      topMenuItem.first().addClass('act');
    }
  });
 //  console.log(menuItemHref);
 //  if(window.location.href.indexOf("/css-notes") > -1) {
 //    console.log('Yeaaah!');
 //   topMenu.find('li:eq(1)').find('a').addClass('act');
 // }
}

$(function () {
  posFuter();
  activMenuItem();
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

$(".fancybox").fancybox({
  openEffect  : 'none',
  closeEffect : 'none'
});

$(".card").setEqualHeight();
});
