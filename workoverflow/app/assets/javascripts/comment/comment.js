$(function(){
    $(".new-comment-block form").on("ajax:success", function(event, data, status, xhr){
      $(this).hide();

      $("#comment-placement").html("<%= escape_javascript(render partial: 'new_comment', locals: {@comment: data.comment}) ) %>")
      $("div.new-comment-block textarea").val("");
      $(this).show();
    })
  })
