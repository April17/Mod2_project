# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Manager.destroy_all
Employee.destroy_all
Task.destroy_all
Project.destroy_all
EmployeeTask.destroy_all



counter = 0
5.times do
  Manager.create(name: Faker::TvShows::GameOfThrones.character, username: "mag#{413+counter}", password: "mag413")
  counter += 1
end
puts "happy manager seeding"

counter = 0
20.times do
  Employee.create(name: Faker::Games::LeagueOfLegends.champion, username:"emp#{413+counter}", password: "emp413", manager: Manager.all.sample)
  counter += 1
end
puts "happy employee seeding"

10.times do
  Project.create(name: Faker::TvShows::GameOfThrones.city, description: Faker::TvShows::GameOfThrones.quote, manager: Manager.all.sample)
end
puts "happy project seeding"

80.times do
  project = Project.all.sample
  Task.create(name: "#{project.name}-Task", project: project, total_working_done: rand(0..20), total_working_time: rand(20..40))
end
puts "happy task seeding"

40.times do
  EmployeeTask.create(hours_done: rand(0..10), task: Task.all.sample, employee: Employee.all.sample)
end




puts "happy seeding"
