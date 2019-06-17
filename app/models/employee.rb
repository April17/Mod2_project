class Employee < ApplicationRecord
  has_many :employee_tasks
  has_many :tasks, through: :employee_tasks
  belongs_to :manager
end
