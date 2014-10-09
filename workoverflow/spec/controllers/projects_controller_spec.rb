require 'spec_helper'

describe ProjectsController do
  it "has an index action for listing all projects" do
    get :index

    expect(response).to render_template(:index)
  end

  it "assigns projects" do
    Project.create!(title: "Testing with RSpec", description: "Testing with the latest and greatest. I want to learn with friends", category: "Testing", location: "Chicago", remote: false, time_estimation: 5, creator_id: 1)

    get :index

    expect(assigns(:projects).length).to eq 1
  end

  it "has an show action for project view" do
    pending
  end
end
