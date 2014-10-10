class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    if logged_in?
      render 'admins/index'
    end
  end

  def show
    @project = Project.find(params[:id])
  end
end
