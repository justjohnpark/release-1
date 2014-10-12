class VotesController < ApplicationController
  def comment_create
    @comment = Comment.find_by_id(params[:id])
    vote_validation = @comment.votes.map {|vote| vote.user.id}
    if vote_validation.include?(session[:user_id])
      flash[:error] = "Nice try! You can only vote once"
      redirect_to admins_project_path(@comment.project)
    else
      Vote.create(voteable_id: params[:id], voteable_type: "Comment", user_id: session[:user_id])
      respond_to do |format|
        format.json { render json: {count: @comment.votes.count}}
        format.html { redirect_to admins_project_path(@comment.project)}
      end
    end
  end


  def project_create
    @project = Project.find_by_id(params[:id])
    vote_validation = @project.votes.map {|vote| vote.user.id}
    if vote_validation.include?(session[:user_id])
      flash[:error] = "Nice try! You can only vote once"
      redirect_to admins_project_path(@project)
    else
      Vote.create(voteable_id: params[:id], voteable_type: "Project", user_id: session[:user_id])
      respond_to do |format|
        format.json { render json: {count: @project.votes.count}}
        format.html { redirect_to admins_project_path(@project)}
      end
    end
  end
end
