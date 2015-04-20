class StringToText < ActiveRecord::Migration
  def change
    change_column :posts, :englishText, :text
    change_column :posts, :englishTitle, :text
    change_column :posts, :englishSummary, :text
  end
end