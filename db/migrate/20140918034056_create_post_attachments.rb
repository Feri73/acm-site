class CreatePostAttachments < ActiveRecord::Migration
  def change
    create_table :post_attachments do |t|
      t.string :title
      t.text :comment
      t.string :attachment

      t.timestamps
    end
  end
end
