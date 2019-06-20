class Manager < ApplicationRecord
  has_many :projects
  has_many :employees
  has_many :mails

  has_secure_password

  validates :username, uniqueness: true

end
