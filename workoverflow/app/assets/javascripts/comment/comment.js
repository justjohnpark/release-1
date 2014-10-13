$(function(){
    $(".new-comment-block form").on("ajax:complete", function(event, data, status, xhr){
      $(this).hide();
      var pattern = /\S/
      var content = $("div.new-comment-block textarea").val()
      var contentRes = pattern.test(content)
      if (contentRes === false){
        $(".new-comment-block").prepend("No blank comments, please.");
        $("div.new-comment-block textarea").val("");
        $(this).show();
      }else{
        $("div.new-comment-block textarea").val("");
        $("#comment-placement").html(data.responseText);
        $(this).show();
      }
   });
 });



