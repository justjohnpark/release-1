require 'spec_helper'

#http://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html

describe ProjectsController do
  before(:each) do
    @user = User.create!(name: "Bob Swinsong", email: "bob@gmail.com", password: "12345", password_confirmation: "12345") 
    @project1 = Project.create!(title: "Yolo", description: "yo", category: "yo", location: "San Francisco", remote: true, time_estimation: 17)
    @project = Project.create!(title: "Y", description: "Learning how to make things way fresh.", category: "Javascript", location: "San Francisco", remote: true, time_estimation: 7 )
    login(@user)
   
  
    
  end



  it "has an index action for listing all projects" do
   
    get :index
    expect(response).to render_template(:index)
  end

  it "has an create action for creating a project" do
     
     post :create, {project: {title: "AJAXifying Stuff", description: "Learning how to make things way fresh.", category: "Javascript", location: "San Francisco", remote: true, time_estimation: 7 } }
     expect(response).to redirect_to(admins_projects_path)
     
  end
  
  it "has an edit action for changing project details" do 
    put :update, { :id => @project.id, :project => { :title => "Yomo" } }
    @project.reload
    @project.title.should eq("Yomo")
    
  end
    
  
  it "has an show action for project view" do 
        
    get :show, id: @project.id
    expect(response).to render_template("admins/show")
  end

  it "has a destroy action for deleting a project" do
      expect{ delete :destroy, id: @project }.to change(Project,:count).by(-1) 
    
  end

end
    
    
    




