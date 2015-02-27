class AddAvatarToMagazine < ActiveRecord::Migration
  def change
    add_column :magazines, :avatar, :string
  end
end
