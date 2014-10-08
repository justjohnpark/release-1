class User < ActiveRecord::Base
  include BCrypt

  has_many :projects, foreign_key: :creator_id
  has_many :commitments
  has_many :collaborations, through: :commitments, source: :project
  has_many :comments
  has_many :votes

  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true

  def password=(plaintext)
    self.password_digest = BCrypt::Password.create(plaintext)
  end

  def password
    BCrypt::Password.new(self.password_digest)
  end

  def authenticate(plaintext_password)
    self.password == plaintext_password
  end
end
