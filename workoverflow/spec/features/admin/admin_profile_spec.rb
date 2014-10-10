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
    end

    it "sees a list of all their projects" do
      # login(@user)
      visit user_path(@user1)
      expect(page).to have_content @project1.title
    end

    it "sees a list of all their commitments" do
      visit user_path(@user1)
      expect(page).to have_content @project2
    end

    it "can link to individual projects" do
      pending
    end

    it "click a link to 'create a project'" do
      pending
    end

    it "has a link to home" do
      pending
    end

    it "has a link to logout" do
      pending
    end

    it "has a sweet effin header" do
      pending
    end
  end
end
