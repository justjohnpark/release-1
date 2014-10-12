$(function() {
  $(".project_delete").on("ajax:success", function(e) {
    var listItem = $(e.target).closest("tr");
    listItem.remove();
  });

  $("#comment-placement").on("ajax:success", ".comment_delete", function(e) {
    var listItem = $(e.target).parent();
    listItem.remove();
  });
});
