class CreateEnglishText < ActiveRecord::Migration
  def change
    add_column :posts, :englishText, :string
    add_column :posts, :englishTitle, :string
    add_column :posts, :englishSummary, :string
  end
end