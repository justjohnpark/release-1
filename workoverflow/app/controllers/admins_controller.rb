class AdminsController < ApplicationController
  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      redirect_to login_form_path
    else
      render 'new'
    end
  end

  def login_form
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to admins_projects_path
    else
      render 'login_form'
    end
  end

  def signout
    session.clear
    redirect_to '/'
  end

end
