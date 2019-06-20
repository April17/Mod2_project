class Employee < ApplicationRecord
  has_many :employee_tasks
  has_many :tasks, through: :employee_tasks
  has_many :mails
  belongs_to :manager

  has_secure_password

  validates :username, uniqueness: true


end
