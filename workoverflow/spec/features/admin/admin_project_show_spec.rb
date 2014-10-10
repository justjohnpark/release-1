require 'spec_helper'

describe "Admin browsing" do
  context "on project page" do

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

    it "sees a project title" do
      visit admins_project_path(@project)

      expect(page).to have_content(@project.title)
    end

    it "sees a project description" do
      visit admins_project_path(@project)

      expect(page).to have_content(@project.description)
    end

    it "sees a voting link" do
      visit admins_project_path(@project)

      expect(page).to have_content("Thumbs UP")
    end

    it "sees the comments" do
      visit admins_project_path(@project)

      expect(page).to have_content(@comment.content)
    end

    it "sees the comment's user" do
      visit admins_project_path(@project)

      expect(page).to have_content(@comment.user.name)
    end

    it "can create a comment" do
      pending
      visit admins_project_path(@project)
    end

    it "can vote on a comment" do
      pending
    end

    it "can vote on a project" do
      pending
    end

    it "sees a link to home" do
      visit admins_project_path(@project)
      expect(page).to have_link("Home", root_path)
    end

    it "sees a link to logout" do
      visit admins_project_path(@project)

      expect(page).to have_link("Logout", logout_path)
    end

    it "can link to 'create project'" do
      visit admins_project_path(@project)

      expect(page).to have_link("Create a Project", logout_path)
    end
  end
end
