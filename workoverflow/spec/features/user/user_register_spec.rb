require 'spec_helper'

describe "User browsing" do
  context "on register page" do
    before(:each) do
      @user = User.new(name: "Tim", email: "t@gmail.com", password: "12345", password_confirmation: "12345")
    end
    it "has a submit button" do
      visit new_user_path
      expect(page).to have_button("Submit")
      fill_in "Enter your name", with: @user.name
      fill_in "Enter your email", with: @user.email
      fill_in "Enter your password", with: @user.password
      fill_in "Please confirm your password", with: @user.password_confirmation
      click_button 'Submit'
    end

    it "has an input field for name" do
      visit new_user_path

      expect(page).to have_selector("input[type=text][name='user[name]']")
    end

    it "has an input field for email" do
      visit new_user_path

      expect(page).to have_selector("input[type=text][name='user[email]']")
    end

    it "has an input field for password" do
      visit new_user_path

      expect(page).to have_selector("input[type=password][name='user[password]']")
    end

    it "has a link to home" do
      visit new_user_path

      expect(page).to have_link("Home", root_path)
    end

    it "has an input field for password confirmation" do
      visit new_user_path

      expect(page).to have_selector("input[type=password][name='user[password_confirmation]']")
    end
  end
end
