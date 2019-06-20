class EmployeeMessage < ApplicationRecord
  belongs_to :sender, class_name: "Employee"
  belongs_to :receiver, class_name: "Employee"
end
