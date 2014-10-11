class CommentsController < ApplicationController
  def create
    @project = Project.find_by_id(params[:project_id])
    comment = @project.comments.create!(content: params[:comment][:content], user_id: session[:user_id])
    respond_to do |format|
        format.json { render json: {comment: comment}}
        format.html { redirect_to admins_project_path(@project)}
      end
  end

  def destroy
    project = Project.find_by_id(params[:project_id])
    project.comments.destroy(params[:id])

    redirect_to admins_project_path(project)
  end
end
