class VotesController < ApplicationController
  def comment_create

  end


  def project_create
    Vote.create(voteable_id: params[:id], voteable_type: "Project",user_id: session[:user_id])
    @project = Project.find_by_id(params[:id])
    respond_to do |format|
      # puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      # puts "I am in the format block"
      format.json { render json: {count: @project.votes.count}}
      format.html { redirect_to admins_project_path(@project)}
    end
    puts "I am at the end of the actions"
  end


  if xhr.request?
    do this

  else



end
