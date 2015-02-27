class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.integer :volume
      t.string :title
      t.date :published_date
      t.text :content
      t.string :attachment

      t.timestamps
    end
  end
end
