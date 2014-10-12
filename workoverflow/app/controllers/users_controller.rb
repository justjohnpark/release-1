class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    if @user
      redirect_to login_form_path
    else
      render 'new'
    end
  end

  def login_form
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to admins_projects_path
      end
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

    private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
