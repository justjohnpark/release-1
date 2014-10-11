require 'spec_helper'

#http://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html

describe ProjectsController do
  let(:user) { User.create!(name: "Bob Swinsong", email: "bob@gmail.com", password: "12345", password_confirmation: "12345") }
  # let(:project) { Project.create!(title: "AJAXifying Stuff", description: "Learning how to make things way fresh.", category: "Javascript", location: "San Francisco", remote: true, time_estimation: 7, creator_id: user.id) }

  it "has an index action for listing all projects" do
    login(user)
    get :index
    expect(response).to render_template(:index)
  end

  it "has an create action for creating a project" do                               #
    login(user)
    post :create, contact: Factory.attributes_for(:contact)
    response.should redirect_to admins_projects_path
  end

  it "has an new action for saving a project" do
    login(user)
    get :new
    expect(response).to render_template(:new)
  end

  it "has an edit action for changing project details" do                           #
    login(user)
    get :edit
    expect(response).to render_template(:edit)
  end

  it "has an show action for project view" do                                       #
    pending
  end

  it "has an update action for saving project detail changes" do
    login(user)
  end

  it "has a destroy action for deleting a project" do
    pending
  end
end
