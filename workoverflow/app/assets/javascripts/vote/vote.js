$(function(){
  $("#comment-placement").on("ajax:success", ".comment-block form", function(event, data, status, xhr){
    var $clicked = $(this);
    $clicked.siblings('span.vote-visual-comment').html(data.count);
  });

  $(".project-vote-block form").on("ajax:success", function(event, data, status, xhr){
		var $clicked = $(this);
    $clicked.siblings("span.vote-visual").html(data.count);
  });

  $("#projects").on("ajax:success", ".project-vote-block form", function(event, data, status, xhr){
		var $clicked = $(this);
    $clicked.siblings("span.vote-visual").html(data.count);
  });
});
