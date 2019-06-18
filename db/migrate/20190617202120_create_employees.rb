class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.integer :manager_id
      t.timestamps
    end
  end
end
