class Project < ApplicationRecord
  belongs_to :manager
  has_many :tasks

  validates :name, presence: true

end
