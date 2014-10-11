class VotesController < ApplicationController
  def comment_create

  end


  def project_create
    puts "______________PARAMS______________"
    puts params
    Vote.create(voteable_id: params[:id], voteable_type: "Project",user_id: session[:user_id])
  end

end
