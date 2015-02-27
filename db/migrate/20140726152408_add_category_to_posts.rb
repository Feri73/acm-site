class AddCategoryToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.belongs_to :category
    end
  end
end
