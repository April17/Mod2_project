class CreateEmployeeMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_messages do |t|
      t.string :title
      t.text :content
      t.integer :sender_id
      t.integer :receiver_id
      t.timestamps
    end
  end
end
