class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    if @user.save
      redirect_to login_form_path
    else
      render 'new'
    end
  end

  def login_form
  end

  def login
    p params
    puts "-------------------TEST-----------------------------"
    @user = User.find_by_email(params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to admins_projects_path
    else
      render 'login_form'
    end
  end

  def show
    show_door
    @user = User.find(params[:id])
  end

  def logout
    session.clear
    redirect_to projects_path
  end

end
