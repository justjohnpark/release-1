class ProjectsController < ApplicationController
  def index
    if logged_in?
      render 'admins/index'
    end
  end
end
