$(function(){
    $(".comment-block form").on("ajax:success", function(event, data, status, xhr){
    var $clicked = $(this);
    $clicked.siblings('span.vote-visual-comment').html(data.count);
  });

  $(".project-vote-block form").on("ajax:success", function(event, data, status, xhr){
    $("span.vote-visual").html(data.count);
  });

})


