class Task < ApplicationRecord
  has_many :employee_tasks
  has_many :employees, through: :employee_tasks
  belongs_to :project

  validates :name, presence: true
  validates :total_working_time, presence: true

  accepts_nested_attributes_for :employee_tasks

  def add_employee(employee_id_new, employee_id_old)
    new_ids = employee_id_new - employee_id_old
    new_ids.each do |id|
      EmployeeTask.create(task: self, employee_id: id)
    end
  end

  def cancel_task(employee_id_new, employee_id_old)
    cancel_ids = employee_id_old - employee_id_new
    task_ets = EmployeeTask.all.select{|et| et.task_id == self.id}
    cancel_ids.each do |id|
      canceling_task = task_ets.find{|et| et.employee_id == id}
      canceling_task.destroy
    end
  end

end
