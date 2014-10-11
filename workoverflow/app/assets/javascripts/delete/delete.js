$(function() {
  $(".project_delete").on("ajax:success", function(e) {
    var listItem = $(e.target).closet("li");
    listItem.remove();
  });
});
