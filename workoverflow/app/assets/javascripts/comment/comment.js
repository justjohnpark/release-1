$(function(){
    $(".new-comment-block form").on("ajax:complete", function(event, data, status, xhr){
      $(this).hide();
      $("div.new-comment-block textarea").val("");
      $("#comment-placement").html(data.responseText)
      $(this).show();
   });
 });
