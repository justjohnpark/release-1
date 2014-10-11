$(function(){
  console.log("loaded page")
    $(".new-comment-block form").on("ajax:success", function(event, data, status, xhr){
      console.log(data)

  })

})
