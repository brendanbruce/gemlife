$(document).ready( function() {
  // init Isotope after all images have loaded
  var $grid = $("[data-js='isotope-grid']").imagesLoaded( function() {
    $grid.isotope({
      itemSelector: "[data-js='isotope-grid-item']",
      layoutMode: 'masonry',
      percentPosition: true,
      masonry: {
        columnWidth: ".js-isotope__column-size",
        gutter: ".js-isotope__gutter-size"
      }
    });
  });
});

