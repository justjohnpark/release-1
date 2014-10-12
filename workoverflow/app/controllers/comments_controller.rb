class CommentsController < ApplicationController
  def create
    @project = Project.find_by_id(params[:project_id])
    @comment = @project.comments.create!(content: params[:comment][:content], user_id: session[:user_id])
    respond_to do |format|
        format.json { render json: {comment: comment}}
        format.html { redirect_to admins_project_path(@project)}
        format.js
      end
  end

  def destroy
    project = Project.find_by_id(params[:project_id])
    project.comments.destroy(params[:id])
    respond_to do |format|
      format.js do
        render nothing: true
      end
      format.any do
        redirect_to admins_project_path(project)
      end
    end
  end
end
