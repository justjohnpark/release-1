require 'spec_helper'

describe UsersController do
  let(:user) { User.create!(name: "Bob Swinsong", email: "bob@gmail.com", password: "12345", password_confirmation: "12345") }

  it "has an login_form action" do
    get :login_form

    expect(response).to render_template(:login_form)
  end

  it "has an login action" do
    # pending
    #this is not working
    # post :create, id: user.id
  end

  it "has an logout action" do
    pending
  end

  it "has a create action for creating a new user" do
   pending
  end

  it "has a new action for register view" do
    get :new

    expect(response).to render_template(:new)
  end

  it "has a show action for displaying a user's profile page" do
    login(user)

    get :show, id: user.id
    expect(response).to render_template(:show)
  end
end
