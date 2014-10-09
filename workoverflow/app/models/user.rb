class User < ActiveRecord::Base
  has_many :projects, foreign_key: :creator_id
  has_many :commitments
  has_many :collaborations, through: :commitments, source: :project
  has_many :comments
  has_many :votes

  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
  validates :password, :length => {:minimum => 5}

  has_secure_password
end
