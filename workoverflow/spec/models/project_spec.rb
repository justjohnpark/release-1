require 'spec_helper'

describe Project do
  let(:project) { Project.new }

  it { should belong_to(:creator) }
  it { should have_many(:comments) }
  it { should have_many(:commitments) }
  it { should have_many(:collaborators) }
  it { should have_many(:votes) }

  it "should have an updated_at column" do
    expect(project).to have_db_column :updated_at
  end

  it "should have a created_at column" do
    expect(project).to have_db_column :created_at
  end

it "should have a title column" do
    expect(project).to have_db_column :title
  end

  it "should have a description column" do
    expect(project).to have_db_column :description
  end

it "should have an category column" do
    expect(project).to have_db_column :category
  end

  it "should have a location column" do
    expect(project).to have_db_column :location
  end

  it "should have an remote column" do
    expect(project).to have_db_column :remote
  end

  it "should have a time_estimation column" do
    expect(project).to have_db_column :time_estimation
  end
end
