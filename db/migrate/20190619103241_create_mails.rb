class CreateMails < ActiveRecord::Migration[5.2]
  def change
    create_table :mails do |t|
      t.string :title
      t.text :content
      t.integer :manager_id
      t.integer :employee_id
      t.timestamps
    end
  end
end
