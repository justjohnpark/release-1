class CommentsController < ApplicationController
  def create
    @project = Project.find_by_id(params[:project_id])
    @project.comments.create!(content: params[:comment][:content], user_id: session[:user_id])

    redirect_to admins_project_path(@project)
  end

  def destroy
    project = Project.find_by_id(params[:project_id])
    project.comments.destroy(params[:id])

    redirect_to admins_project_path(project)
  end
end
