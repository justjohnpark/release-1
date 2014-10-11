$(function(){
  console.log("page loaded")
  $("form[data-remote=true]").on("ajax:success", function(event, data, status, xhr){
    console.log(data.count);
    $("span.vote-visual").html(data.count)
  })
})


