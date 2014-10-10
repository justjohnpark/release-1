require 'spec_helper'

describe Comment do
  let(:comment) {Comment.new(content: "hi")}

  it { should belong_to(:project) }
  it { should belong_to(:user) }
  it { should have_many(:votes) }

  it "should have a column called 'content'" do
    expect(comment).to have_db_column :content
  end

  it "should have a column called 'user_id'" do
    expect(comment).to have_db_column :user_id
  end

  it "should have a column called 'project_id'" do
    expect(comment).to have_db_column :project_id
  end

  it "should have an updated_at column" do
    expect(comment).to have_db_column :updated_at
  end

  it "should have a created_at column" do
    expect(comment).to have_db_column :created_at
  end
end




