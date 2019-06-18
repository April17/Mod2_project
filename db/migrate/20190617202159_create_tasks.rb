class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :project_id
      t.decimal :total_working_time
      t.decimal :total_working_done, :default => 0
      t.integer :pre_task, :default => 0
      t.timestamps
    end
  end
end
