# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
manager1 = Manager.create(name: "Tom Jaky", username: "tom413", password: "tom413")

project1 = Project.create(name: "Mod2 Project", description: "Project management tool for Manager and employee", manager: manager1)

task1 = Task.create(name: "Task1", project: project1, total_working_time: 20.5)
task2 = Task.create(name: "Task2", project: project1, total_working_time: 10.5, pre_task: task1.id)

employee1 = Employee.create(name: "Tim Dunky", username:"tim413", password:"tim413", manager: manager1)
employee2 = Employee.create(name: "Kim Junky", username:"kim413", password:"kim413", manager: manager1)

et1 = EmployeeTask.create(hours_done: 5.5, task: task1, employee: employee1)
et2 = EmployeeTask.create(hours_done: 15.0, task: task1, employee: employee2)


puts "happy seeding"
