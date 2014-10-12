require 'spec_helper'

describe CommentsController do

  before(:each) do
      @user = User.create!(name: "Bob Swinsong", email: "bob@gmail.com", password: "12345", password_confirmation: "12345")
      @project = Project.create!(title: "Testing with RSpec", description: "Testing with the latest and greatest. I want to learn with friends", category: "Testing", location: "Chicago", remote: false, time_estimation: 5, creator_id: @user.id)
      @comment = Comment.create!(content: "This is so cool!", user_id: @user.id)
      @project.comments << @comment
      @vote1 = Vote.create!(user_id: @user.id, voteable_id: @project.id, voteable_type: @project.class.to_s)
      @project.votes << @vote1
      @vote2 = Vote.create!(user_id: @user.id, voteable_id: @comment.id, voteable_type: @comment.class.to_s)
      @comment.votes << @vote2

      visit login_form_path
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      click_button 'Login'
      visit user_path(@user)
  end

  it "has a create action for creating a new comment" do
    post :create, {comment: {content: @comment.content}, user_id: @comment.user.id, project_id: @comment.project.id}

    expect(response).to redirect_to(admins_project_path(@project))
  end

  it "'s create action changes the comment count by 1" do
    expect{
      post :create, {comment: {content: @comment.content}, user_id: @comment.user.id, project_id: @comment.project.id}
    }.to change{Comment.count}.by(1)
  end

  it "has a destroy action for deleting a comment" do
    post :destroy, {project_id: @comment.project.id, id: @comment.id}

    expect(response).to redirect_to(admins_project_path(@project))
  end

  it "'s destroy action changes the comment count by -1" do

    expect{
      post :destroy, {project_id: @comment.project.id, id: @comment.id}
    }.to change{Comment.count}.by(-1)
  end
end
