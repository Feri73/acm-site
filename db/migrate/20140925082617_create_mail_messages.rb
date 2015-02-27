class CreateMailMessages < ActiveRecord::Migration
  def change
    create_table :mail_messages do |t|
      t.text :body
      t.string :subject

      t.timestamps
    end
  end
end
