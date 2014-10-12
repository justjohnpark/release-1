require 'spec_helper'

describe VotesController do
    before(:each) do
      @user = User.create!(name: "Bob Swinsong", email: "bob@gmail.com", password: "12345", password_confirmation: "12345")
      user =  User.create!(name: "Bob ", email: "b@gmail.com", password: "12345", password_confirmation: "12345")
      @project = Project.create!(title: "Testing with RSpec", description: "Testing with the latest and greatest. I want to learn with friends", category: "Testing", location: "Chicago", remote: false, time_estimation: 5, creator_id: @user.id)
      # project = Project.create!(title: "Testing ", description: "Testing with t. I want to learn with friends", category: "Testing", location: "Chicago", remote: false, time_estimation: 5, creator_id: user.id)
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

  it "has an action that increases vote count for comments on the project show page by 1" do
      pending
      login(@user)
      visit admins_project_path(@project)
      expect{click_button("Thumbs UP")}.to change(@project.votes,:count).by(1)

  end

  it "has an action that increases vote count for project on the project show page by 1 " do
      pending
      login(@user)
      visit admins_project_path(@project)
      expect{click_button("Like Comment")}.to change(@comment.votes,:count).by(1)
        
      

  end

  it "can vote on project more than once" do
      login(@user)
      visit admins_projects_path
      expect{click_button("+1")}.to change(@project.votes,:count).by(0)     
      
      # expect(response).to render_template("admins/index")
      
  end

end
