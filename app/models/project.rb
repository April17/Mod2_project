class Project < ApplicationRecord
  belongs_to :manager
  has_many :tasks
end
