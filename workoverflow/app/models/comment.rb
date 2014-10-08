class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :votes, as: :voteable
end
