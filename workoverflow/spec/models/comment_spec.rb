require 'spec_helper'

describe Comment do
  it { should belong_to(:project) }
  it { should belong_to(:user) }
  it { should have_many(:votes) }
end
