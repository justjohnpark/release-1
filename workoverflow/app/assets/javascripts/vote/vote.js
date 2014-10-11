$(function(){
  console.log("page loaded")
  $("a[data-remote=true].vote-project").on("ajax:success", function(event, data){
    console.log(event.target)
    console.log(data)


  })

})


