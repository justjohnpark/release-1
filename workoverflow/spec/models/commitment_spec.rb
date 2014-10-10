require 'spec_helper'

describe Commitment do
  let(:commitment) { Commitment.new }

  it { should belong_to(:user) }
  it { should belong_to(:project) }

  it "should have an updated_at column" do
    expect(commitment).to have_db_column :updated_at
  end

  it "should have a created_at column" do
    expect(commitment).to have_db_column :created_at
  end
end
