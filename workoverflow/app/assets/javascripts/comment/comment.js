$(function(){
    $(".new-comment-block form").on("ajax:success", function(event, data, status, xhr){
      $(this).hide();

      $("#comment-placement").empty().append("<%= j render partial: 'layouts/comment', locals:{project: data.project} %>")
      $("div.new-comment-block textarea").val("");
      $(this).show();
    })
  })
