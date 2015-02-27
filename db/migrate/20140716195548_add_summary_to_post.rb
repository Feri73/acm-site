class AddSummaryToPost < ActiveRecord::Migration
  def up
    add_column :posts, :summary, :string
  end
  def down
    remove_column :posts, :summary
  end
end
