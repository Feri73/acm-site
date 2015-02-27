class AddOtherMailsToMailMessage < ActiveRecord::Migration
  def change
    add_column :mail_messages, :OtherMails, :string
  end
end
