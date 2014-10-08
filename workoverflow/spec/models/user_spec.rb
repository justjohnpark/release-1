require 'spec_helper'

describe User do
  it { should have_many(:projects).with_foreign_key('creator_id') }
  it { should have_many(:commitments) }
  it { should have_many(:collaborations) }
  it { should have_many(:comments) }
  it { should have_many(:votes) }
end
