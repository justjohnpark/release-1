require 'spec_helper'

describe Vote do
  let(:vote) { Vote.new }

  it { should belong_to(:user) }
  it { should belong_to(:voteable) }

  it "should have an updated_at column" do
    expect(vote).to have_db_column :updated_at
  end

  it "should have a created_at column" do
    expect(vote).to have_db_column :created_at
  end
end


