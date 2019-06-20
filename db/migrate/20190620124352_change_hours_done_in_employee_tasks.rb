class ChangeHoursDoneInEmployeeTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :employee_tasks, :hours_done, :decimal, :default => 0
  end
end
