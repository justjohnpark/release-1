class VotesController < ApplicationController
  def comment_create

  end


  def project_create

    puts "______________PARAMS______________"
    puts params
    Vote.create(voteable_id: params[:id], voteable_type: "Project",user_id: session[:user_id])
    @project = Project.find_by_id(params[:id])
    respond_to do |format|
      format.html { redirect_to admins_project_path(@project)}
      format.json { render json: {count: @project.votes.count}}
      format.any do
        render nothing: true
      end
    end
  end

end
