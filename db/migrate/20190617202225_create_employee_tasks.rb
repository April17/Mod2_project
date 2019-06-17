class CreateEmployeeTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_tasks do |t|

      t.timestamps
    end
  end
end
