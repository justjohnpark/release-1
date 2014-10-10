class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    if logged_in?
      render 'admins/index'
    end
  end

  def create
    @project = Project.new(title: params[:project][:title], description: params[:project][:description], category: params[:project][:category], location: params[:project][:category], remote: remote_check(params[:project][:remote]), time_estimation: params[:project][:time_estimation].to_i, creator_id: session[:user_id])
    if @project.save
      redirect_to admins_projects_path
    else
      render 'new'
    end
  end

  def new
    if logged_in?
      @project = Project.new
    end
  end

  def show
    @project = Project.find(params[:id])
    if logged_in?
      render 'admins/show'
    end
  end

    private

  def project_params
    params.require(:category).permit(:title, :category, :location, :remote, :time_estimation, :description)
  end

  def remote_check(number)
    number == "1"
  end
end
