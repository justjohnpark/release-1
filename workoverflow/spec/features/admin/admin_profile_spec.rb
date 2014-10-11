require 'spec_helper'

describe "Admin viewing" do
  context "profile" do

    before(:each) do
      @user1 = User.create!(name: "Bob Swinsong", email: "bob@gmail.com", password: "12345", password_confirmation: "12345")
      @user2 = User.create!(name: "Susan Swinsong", email: "susan@gmail.com", password: "12345", password_confirmation: "12345")
      @project1 = Project.create!(title: "Testing with RSpec", description: "Testing with the latest and greatest. I want to learn with friends", category: "Testing", location: "Chicago", remote: false, time_estimation: 5, creator_id: @user1.id)
      @project2 = Project.create!(title: "AJAXifying Stuff", description: "Learning how to make things way fresh.", category: "Javascript", location: "San Francisco", remote: true, time_estimation: 7, creator_id: @user2.id)
      Commitment.create!(user_id: @user1.id, project_id: @project2.id)
      Commitment.create!(user_id: @user2.id, project_id: @project1.id)

      visit login_form_path
      fill_in "email", with: @user1.email
      fill_in "password", with: @user1.password
      click_button 'Login'

      visit user_path(@user1)
    end

    it "sees a list of all their projects" do
      expect(page).to have_content @project1.title
    end

    it "sees a list of all their commitments" do
      expect(page).to have_content @project2.title
    end

    it "can link to individual projects" do
      click_link @project1.title

      expect(page).to have_content @project1.description
    end

    it "can link to individual commitment" do
      click_link @project2.title

      expect(page).to have_content @project2.description
    end

    it "click a link to 'create a project'" do
      click_link "Create a Project"

      expect(page).to have_content "Create a Project"
    end

    it "has a link to home" do
      click_link "Home"

      expect(page).to have_content "Current Projects"
      expect(page).to have_content "Logout"
    end

    it "has a link to logout" do
      click_link "Logout"

      expect(page).to have_content "Current Projects"
      expect(page).to have_content "Sign in"
      expect(page).to have_content "Register"
    end

    it "has a sweet effin header" do
      expect(page).to have_content "Home"
      expect(page).to have_content "Profile"
      expect(page).to have_content "Logout"
    end
  end
end
