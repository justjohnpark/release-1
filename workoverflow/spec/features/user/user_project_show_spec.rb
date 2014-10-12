require 'spec_helper'

describe "User browsing" do
  context "on project page" do
    before(:each) do
      @user =  User.create!(name: "Susan Swinsong", email: "susan@gmail.com", password: "12345", password_confirmation: "12345") 
      @project =  Project.create!(title: "Testing with RSpec", description: "Testing with the latest and greatest. I want to learn with friends", category: "Testing", location: "Chicago", remote: false, time_estimation: 5, creator_id: @user.id) 
    
    end
    it "sees a project title" do
      visit project_path(@project)

      expect(page).to have_content("Testing with RSpec")
    end

    it "sees the comments" do
      pending
      @project.comments.create!(content: "That is a great idea.", user_id: @user.id)

      visit project_path(@project)
      save_and_open_page
      expect(page).to have_content("That is a great idea.")
    end

    it "sees the comment's user" do
      pending
      @project.comments.create!(content: "That is a great idea.", user_id: @user.id)

      visit project_path(@project)

      expect(page).to have_content("Susan Swinsong")
    end

    it "sees a link to home" do
      visit project_path(@project)

      expect(page).to have_link("Home", root_path)
    end

    it "sees a count for votes" do
      @project.votes.create!(user_id: @user.id)

      visit project_path(@project)

      expect(page).to have_content("1")
    end

    it "sees a link to login" do
      visit project_path(@project)

      expect(page).to have_link("Sign in", login_path)
    end

    it "sees a link to register" do
      visit project_path(@project)

      expect(page).to have_link("Register", new_user_path)
    end
  end
end
