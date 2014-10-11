# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(name: "Bob Swinsong", email: "bob@gmail.com", password: "12345", password_confirmation: "12345")
User.create!(name: "Susan Swinsong", email: "susan@gmail.com", password: "12345", password_confirmation: "12345")

Project.create!(title: "Testing with RSpec", description: "Testing with the latest and greatest. I want to learn with friends", category: "Testing", location: "Chicago", remote: false, time_estimation: 5, creator_id: 1)
Project.create!(title: "AJAXifying Stuff", description: "Learning how to make things way fresh.", category: "Javascript", location: "San Francisco", remote: true, time_estimation: 7, creator_id: 2)
Project.create!(title: "Ruby on Rails", description: "Learning how to make things way fresh.", category: "Rails", location: "San Francisco", remote: true, time_estimation: 7, creator_id: 2)
Project.create!(title: "Jasmine Testing", description: "Learning how to make things way fresh.", category: "Javascript", location: "New York", remote: false, time_estimation: 7, creator_id: 2)
Project.create!(title: "JS in Rails", description: "Learning how to make things way fresh.", category: "Rails", location: "San Francisco", remote: true, time_estimation: 7, creator_id: 2)

Commitment.create!(user_id: 1, project_id: 2)
Commitment.create!(user_id: 2, project_id: 1)

Vote.create!(user_id: 1, voteable_id: 1, voteable_type: "Project")
Vote.create!(user_id: 1, voteable_id: 1, voteable_type: "Project")
Vote.create!(user_id: 1, voteable_id: 1, voteable_type: "Project")
Vote.create!(user_id: 1, voteable_id: 1, voteable_type: "Project")
Vote.create!(user_id: 1, voteable_id: 1, voteable_type: "Project")

Vote.create!(user_id: 1, voteable_id: 2, voteable_type: "Project")
Vote.create!(user_id: 1, voteable_id: 2, voteable_type: "Project")
Vote.create!(user_id: 1, voteable_id: 2, voteable_type: "Project")
Vote.create!(user_id: 1, voteable_id: 2, voteable_type: "Project")

Vote.create!(user_id: 1, voteable_id: 3, voteable_type: "Project")
Vote.create!(user_id: 1, voteable_id: 3, voteable_type: "Project")
Vote.create!(user_id: 1, voteable_id: 3, voteable_type: "Project")

Vote.create!(user_id: 1, voteable_id: 4, voteable_type: "Project")
Vote.create!(user_id: 1, voteable_id: 4, voteable_type: "Project")

Vote.create!(user_id: 1, voteable_id: 5, voteable_type: "Project")


