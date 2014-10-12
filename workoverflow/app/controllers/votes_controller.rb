class VotesController < ApplicationController
  def comment_create
    Vote.create(voteable_id: params[:id], voteable_type: "Comment", user_id: session[:user_id])
      @comment = Comment.find_by_id(params[:id])
      puts "__________Comment___________________________________________"
      p @comment
      puts "____________"
      p @comment.id
      respond_to do |format|
        format.json { render json: {count: @comment.votes.count}}
        format.html { redirect_to admins_project_path(@comment.project)}
      end
  end


  def project_create
    Vote.create(voteable_id: params[:id], voteable_type: "Project", user_id: session[:user_id])
    @project = Project.find_by_id(params[:id])
    respond_to do |format|
      format.json { render json: {count: @project.votes.count}}
      format.html { redirect_to admins_project_path(@project)}
    end
  end

end
