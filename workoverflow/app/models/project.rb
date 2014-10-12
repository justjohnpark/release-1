class Project < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :comments
  has_many :commitments
  has_many :collaborators, through: :commitments, source: :user
  has_many :votes, as: :voteable

  validates :creator, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :location, presence: true
  validates :time_estimation, presence: true

  def self.sort_hash(sort_type)
    sort_array = []
    projects = Project.all
    projects = projects.reverse if sort_type == "created_at"
    projects.each do |project|
      sort_array << project.send(sort_type)
    end

    Hash[projects.zip sort_array].group_by { |k, v| v }
  end

  def self.popularity_sort
    Project.all.sort_by { |project| project.votes.count }.reverse
  end
end
