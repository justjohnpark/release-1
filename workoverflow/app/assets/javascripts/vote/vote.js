$(function(){
  console.log("page loaded")
  $("a[data-remote=true].vote-project").on("ajax:sucess", function(event){
    event.preventDefault();
    console.log("event prevented!!!")
  })

})


