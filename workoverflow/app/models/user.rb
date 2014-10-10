class User < ActiveRecord::Base
  has_many :projects, foreign_key: :creator_id
  has_many :commitments
  has_many :collaborations, through: :commitments, source: :project
  has_many :comments
  has_many :votes

  validates :name, presence: true, :length => {:minimum => 2}
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/, on: :create }
  validates :password, :length => {:minimum => 5}

  has_secure_password
end
