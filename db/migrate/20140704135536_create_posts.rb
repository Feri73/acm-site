class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.string :tags
      t.datetime :publishDate

      t.timestamps
    end
  end
end
