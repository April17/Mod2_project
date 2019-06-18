class Manager < ApplicationRecord
  has_many :projects
  has_many :employees

  has_secure_password

  # def password=(pass)
  #   self.password_digest = BCrypt::Password.create(pass)
  # end
  #
  # def authenticate(pass)
  #   BCrypt::Password.new(self.password_digest) == pass
  # end

end
