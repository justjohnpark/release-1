class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :votes, as: :voteable

  # validates :content, :presence => {:message => "must be present"}
  validates :user_id, presence: true
  validates :project_id, presence: true
end
