$(function(){
  console.log("page loaded")
    $(".comment-block form").on("ajax:success", function(event, data, status, xhr){
    console.log(event.target)
    var $clicked = $(this)
    $clicked.siblings('span.vote-visual-comment').html(data.count)
  })


  $(".project-vote-block form").on("ajax:success", function(event, data, status, xhr){
    $("span.vote-visual").html(data.count)
  })

})


