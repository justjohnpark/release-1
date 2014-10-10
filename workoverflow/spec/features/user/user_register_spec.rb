require 'spec_helper'

describe "User browsing" do
  context "on register page" do
    let(:user) { User.new(name: "Bob Bilbob", email: "bob@gmail.com", password: "freedom", password_confirmation: "freedom") }

    it "has a submit button" do
      visit new_user_path

      expect(page).to have_selector("input[type=submit][value='Register']")
      click_button("Register")
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
