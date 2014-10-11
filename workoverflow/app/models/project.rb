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

  scope :popularity_sort, joins(:votes).
                            select('projects.id, projects.title, projects.category').
                            group('projects.id')

  def self.category_hash
    category_array = [] 
    projects = Project.all
    projects.each do |project|
      category_array << project.category
    end

    Hash[projects.zip category_array].group_by { |k, v| v }
  end

  def self.location_hash
    location_array = [] 
    projects = Project.all 
    projects.each do |project|
      location_array << project.location
    end

    Hash[projects.zip location_array].group_by { |k, v| v }
  end

  def self.remote_hash
    remote_array = [] 
    projects = Project.all 
    projects.each do |project|
      remote_array << project.remote.to_s
    end

    Hash[projects.zip remote_array].group_by { |k, v| v }
  end

end
