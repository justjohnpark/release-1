$(function() {
  $(".project_uncommit").on("ajax:success", function(e) {
    var listItem = $(e.target).closest("tr");
    listItem.remove();
  });
});
