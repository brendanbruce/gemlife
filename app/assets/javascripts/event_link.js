$(function() {
  $("#linkTrigger").bind("ajax:success", function(event, data, status, xhr) {
    $(".sidebar-main").prepend(data.description);
    console.log(event);
    console.log(data);
    console.log(status);
    console.log(xhr);
  });
});

