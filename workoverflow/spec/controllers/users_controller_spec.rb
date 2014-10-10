require 'spec_helper'

describe UsersController do
  let(:user) { User.create!(name: "Bob Swinsong", email: "bob@gmail.com", password: "12345", password_confirmation: "12345") }

  it "has an login_form action" do
    get :login_form

    expect(response).to render_template(:login_form)
  end

  it "has an login action" do
    post :login, {email: user.email, password: user.password}

    project = Project.create!(title: "Testing with RSpec", description: "Testing with the latest and greatest. I want to learn with friends", category: "Testing", location: "Chicago", remote: false, time_estimation: 5, creator_id: 1)

    expect(response).to redirect_to(admins_projects_path)
  end

  it "has an logout action" do
    post :logout

    expect(response).to redirect_to(projects_path)
  end

  it "has a create action for creating a new user" do
    post :create, user: {name: user.name, email: user.email, password: user.password, password_confirmation: user.password_confirmation}

    expect(response).to redirect_to(login_form_path)
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
