require 'spec_helper'

describe "User browsing" do
  context "on login page" do
    let(:user) { User.new(name: "Bob Bilbob", email: "bob@gmail.com", password: "freedom", password_confirmation: "freedom") }

    it "has a submit button" do
      visit login_path

      expect(page).to have_selector("input[type=submit][value='Login']")
    end

    it "can login" do
      visit login_path
      @user= User.create(name: "Jim", email: "b@gmail.com", password: "freedom", password_confirmation: "freedom")
      fill_in 'Enter your email', with: @user.email
      fill_in 'Enter your password', with: @user.password
      click_on('Login')
    end

    it "has an input field for email" do
      visit login_path

      expect(page).to have_selector("input[type=text][name='email']")
    end

    it "has an input field for password" do
      visit login_path

      expect(page).to have_selector("input[type=password][name='password']")
    end

    it "has a link to home" do
      visit login_path

      expect(page).to have_link("Home", root_path)
    end
  end
end
