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
      @project.update(creator_id: session[:user_id])
      redirect_to admins_projects_path
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.js do
        render nothing: true
      end
      format.any do
        redirect_to user_path(session[:user_id])
      end
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

  def edit
    show_door unless current_user
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    if @project.save
      redirect_to admins_projects_path
    else
      render 'edit'
    end
  end

    private

  def project_params
    params.require(:project).permit(:title, :category, :location, :remote, :time_estimation, :description)
  end

end
