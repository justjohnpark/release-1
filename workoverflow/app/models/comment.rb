class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :votes, as: :voteable

  # validates :content, presence: { true, message: "can't be blank" }
  validates :user_id, presence: true
  validates :project_id, presence: true
end
