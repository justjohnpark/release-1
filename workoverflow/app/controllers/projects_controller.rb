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

  def commit
    @project = Project.find(params[:id])
    if session[:user_id] == @project.creator_id
      redirect_to admins_project_path(@project)
    else
      @commitment = Commitment.create!(user_id: session[:user_id], project_id: @project.id)
      respond_to do |format|
        format.js do
          render nothing: true
        end
        format.any do
          redirect_to user_path(session[:user_id])
        end
      end
    end
  end

  def uncommit
    @commitment = Commitment.find_by(project_id: params[:id])
    @commitment.destroy
    respond_to do |format|
      format.js do
        render nothing: true
      end
      format.any do
        redirect_to user_path(session[:user_id])
      end
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
    @project = Project.new if logged_in?
  end

  def show
    @project = Project.find(params[:id])
    @comment = Comment.new
    @user = User.find_by_id(@project.creator.id)
    render 'admins/show' if logged_in?
  end

  def edit
    show_door
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

  def sort
    @sort = params[:sort]
    @projects = Project.sort_hash(@sort)
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def popularity_sort
    @projects = Project.popularity_sort
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def admin_sort
    @sort = params[:sort]
    @projects = Project.sort_hash(@sort)
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def admin_popularity_sort
    @projects = Project.popularity_sort
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :category, :location, :remote, :time_estimation, :description)
  end
end
