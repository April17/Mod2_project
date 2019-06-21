class AddSenderToMail < ActiveRecord::Migration[5.2]
  def change
    add_column :mails, :sender, :string
  end
end
