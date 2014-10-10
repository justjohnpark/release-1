require 'spec_helper'

describe User do
  let(:user) { User.new }

  it { should have_many(:projects).with_foreign_key('creator_id') }
  it { should have_many(:commitments) }
  it { should have_many(:collaborations) }
  it { should have_many(:comments) }
  it { should have_many(:votes) }

  it "should have a name column" do
    expect(user).to have_db_column :name
  end

  it "should have an email column" do
    expect(user).to have_db_column :email
  end

  it "should have a password_digest column" do
    expect(user).to have_db_column :password_digest
  end

  it "should have an updated_at column" do
    expect(user).to have_db_column :updated_at
  end

  it "should have a created_at column" do
    expect(user).to have_db_column :created_at
  end

  it "name cannot be blank" do
    user = User.create(:name => "")
    expect(user.errors[:name][0]).to eq("can't be blank")
  end

  it "name cannot be blank" do
    user = User.create(:name => "a")
    expect(user.errors[:name][0]).to eq("is too short (minimum is 2 characters)")
  end

  it "should require a valid email" do
    user = User.create(:email => "susan@")
    expect(user.errors[:email][0]).to eq("is invalid")
  end

  it "should require a valid password" do
    user = User.create(:password => "susa")
    expect(user.errors[:password][0]).to eq("is too short (minimum is 5 characters)")
  end

  it "should require a valid password" do
    user = User.create(:password => "susa")
    expect(user.errors[:password][0]).to eq("is too short (minimum is 5 characters)")
  end
end
