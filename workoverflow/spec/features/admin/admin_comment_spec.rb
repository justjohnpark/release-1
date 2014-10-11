require 'spec_helper'

describe "Admin browsing" do
  context "on project page's comment form" do

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

    it "should have field for project title" do
      visit admins_project_path(@project)

      expect(page).to have_button("Comment!")
    end

    it "should have a text field" do
      visit admins_project_path(@project)

      expect(page).to have_selector("[name='comment[content]']")
    end
  end
end
