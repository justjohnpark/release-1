require 'spec_helper'

describe "Admin browsing" do
  context "on edit project page" do

     before(:each) do
      @user = User.create!(name: "Bob Swinsong", email: "bob@gmail.com", password: "12345", password_confirmation: "12345")
      @project = Project.create!(title: "Testing with RSpec", description: "Testing with the latest and greatest. I want to learn with friends", category: "Testing", location: "Chicago", remote: false, time_estimation: 5, creator_id: @user.id)
      visit login_form_path
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      click_button 'Login'

      visit edit_project_path(@project)
      fill_in "Title", with: @project.title
      fill_in "Category", with: @project.category
      fill_in "Location", with: @project.location
      fill_in "Time estimation", with: @project.time_estimation
      fill_in "Description", with: @project.description
    end

    it "has a sweet header" do
      expect(page).to have_content "Home"
      expect(page).to have_content "Profile"
      expect(page).to have_content "Logout"
    end

    it "has a submit button" do
      click_button "Update Project"
      expect(page).to have_content "Current Project"
    end

    it "has an input field for project title" do
      page.should have_field("Title")
    end

    it "has an input field for project description" do
      page.should have_field("Description")
    end

    it "has an input field for everything else" do
      page.should have_field("Category")
      page.should have_field("Location")
      page.should have_field("Time estimation")
      expect(page).to have_content "Work Remotely?"
    end

    it "has a link to home" do
      click_link "Home"

      expect(page).to have_content "Current Projects"
      expect(page).to have_content "Logout"
    end
  end
end
