class CreateUserMailMessages < ActiveRecord::Migration
  def change
    create_table :user_mail_messages do |t|
      t.integer :user_id
      t.integer :mail_id
      t.string :email

      t.timestamps
    end
  end
end
