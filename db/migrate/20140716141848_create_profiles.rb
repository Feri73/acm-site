class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :last
      t.date :birthday
      t.integer :gender

      t.belongs_to :user

      t.timestamps
    end
  end
end
