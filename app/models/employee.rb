class Employee < ApplicationRecord
  has_many :employee_tasks, :dependent => :destroy
  has_many :tasks, through: :employee_tasks
  has_many :mails, :dependent => :destroy
  belongs_to :manager

  has_many :sent_employee_messages, :foreign_key => 'sender_id', class_name: "EmployeeMessage", :dependent => :destroy
  has_many :sent_employee_messages_to, through: :sent_employee_messages, source: :receiver

  has_many :received_employee_messages, :foreign_key => 'receiver_id', class_name: "EmployeeMessage", :dependent => :destroy
  has_many :received_employee_messages_from, through: :received_employee_messages, source: :sender

  has_secure_password

  validates :username, uniqueness: true


end
