class User < ActiveRecord::Base
  has_many :projects, foreign_key: :creator_id
  has_many :commitments
  has_many :collaborations, through: :commitments, source: :project
  has_many :comments
  has_many :votes
end
