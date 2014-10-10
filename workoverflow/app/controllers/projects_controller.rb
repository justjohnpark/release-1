class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    if logged_in?
      render 'admins/index'
    end
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to admins_projects_path
    else
      render 'new'
    end
  end

  def new
    show_door
    if logged_in?
      @project = Project.new
    end
  end

  def show
    @project = Project.find(params[:id])
    @comment = Comment.new
    @user = User.find_by_id(session[:user_id])
    if logged_in?
      render 'admins/show'
    end
  end

    private

  def project_params
    params.require(:project).permit(:title, :category, :location, :remote, :time_estimation, :description)
  end
end
