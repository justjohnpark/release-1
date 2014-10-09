require 'spec_helper'

describe UsersController do
  before(:all) do
    @user = User.create!(name: "Bob Swinsong", email: "bob@gmail.com", password: "12345", password_confirmation: "12345")
  end

  it "has an login_form action" do
    pending
  end

  it "has an login action" do
    pending
  end

  it "has an logout action" do
    pending
  end

  it "has a create action for creating a new user" do
    pending
  end

  it "has a new action for register view" do
    pending
  end

  it "has a show action for displaying a user's profile page" do

  end
end
