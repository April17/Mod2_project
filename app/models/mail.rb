class Mail < ApplicationRecord
  belongs_to :employees
  belongs_to :managers
end
