$(document).ready( function() {
  // init Isotope after all images have loaded
  var $grid = $('.flyer-grid').imagesLoaded( function() {
    $grid.isotope({
      itemSelector: '.flyer-grid__flyer',
      layoutMode: 'masonry',
      percentPosition: true,
      masonry: {
        columnWidth: ".flyer-grid__sizer",
        gutter: ".flyer-gutter"
      }
    });
  });
});

