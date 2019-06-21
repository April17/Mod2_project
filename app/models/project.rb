class Project < ApplicationRecord
  belongs_to :manager
  has_many :tasks, :dependent => :destroy

  validates :name, presence: true

end
