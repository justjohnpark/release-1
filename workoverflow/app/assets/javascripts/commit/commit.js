$(function() {
  $(".project_commit").on("ajax:success", function(e) {
  	$("#commit-link").append("<h3 class='section-subheading text-muted'>You have committed to this project</h3>")
  });
});
