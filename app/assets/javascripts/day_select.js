$(function() {
  $("#daySelector").on("change", function(e) {
    if ($(this).val() !== '') {
      window.location.href="events?find_by=" + $(this).val();
    }
  });
});

