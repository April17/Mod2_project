class CreateEmployeeTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_tasks do |t|
      t.decimal :hours_done
      t.integer :task_id
      t.integer :employee_id
      t.timestamps
    end
  end
end
