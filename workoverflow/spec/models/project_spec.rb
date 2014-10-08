require 'spec_helper'

describe Project do
  it { should belong_to(:creator) }
  it { should have_many(:comments) }
  it { should have_many(:commitments) }
  it { should have_many(:collaborators) }
  it { should have_many(:votes) }
end
