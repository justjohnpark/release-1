class Project < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :comments
  has_many :commitments
  has_many :collaborators, through: :commitments, source: :user
  has_many :votes, as: :voteable

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :location, presence: true
  validates :time_estimation, presence: true
end
