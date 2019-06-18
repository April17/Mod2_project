class Employee < ApplicationRecord
  has_many :employee_tasks
  has_many :tasks, through: :employee_tasks
  belongs_to :manager

  has_secure_password

  # def password=(pass)
  #   self.password_digest = BCrypt::Password.create(pass)
  # end
  #
  # def authenticate(pass)
  #   BCrypt::Password.new(self.password_digest) == pass
  # end

end
