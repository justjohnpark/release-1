$(function(){
  console.log("loaded page")
    $(".new-comment-block form")
    .on("ajax:beforeSend", function(){$(this).hide()})
    .on("ajax:success", function(event, data, status, xhr){
      $("body").append("<div class="comment-block">
  <%= comment.content %><br>
  <%= comment.user.name %><br>
  <% if comment.user.id == @user.id %>

  <span class="vote-visual-comment" id="<%= index %>">  <%= comment.votes.length %>  </span>

  <%= button_to "Like Comment", comment_vote_path(comment) + '.json', "data-type" => :json, method: :post, class: "comment-project", remote: true %>

  <%= link_to "Delete", admins_project_comment_path(@project, comment), method: :delete, confirm: "Are you sure?" %>
</div>");
  })
})
