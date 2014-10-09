require 'spec_helper'

describe "User browsing" do
  context "on homepage" do
    it "sees a list of all the projects" do
      Project.create!(title: "Testing with RSpec", description: "Testing with the latest and greatest. I want to learn with friends", category: "Testing", location: "Chicago", remote: false, time_estimation: 5, creator_id: 1)
      visit root_path

      expect(page).to have_content("Testing with RSpec")
    end

    it "has clickable titles for each project" do
      project = Project.create!(title: "Testing with RSpec", description: "Testing with the latest and greatest. I want to learn with friends", category: "Testing", location: "Chicago", remote: false, time_estimation: 5, creator_id: 1)
      visit root_path
      expect(page).to have_link("Testing with RSpec", project_path(project))
    end

    it "has a login link" do
      visit root_path
      expect(page).to have_link("Sign in", login_path)
    end

    it "has a register link" do
      visit root_path
      expect(page).to have_link("Register", new_user_path)
    end

    it "has a sort feature" do
      pending
      visit root_path
    end

    # it "has a login and register link" do

    #   expect(page).to have_content("Register")
    # end

  end
end
