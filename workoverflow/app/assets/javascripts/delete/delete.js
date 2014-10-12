$(function() {
  $(".project_delete").on("ajax:success", function(e) {
    console.log(e.target)
    var listItem = $(e.target).closest("tr");
    listItem.remove();
  });
});
