class RenameProfileImageUrlColumnToUser < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :profile_image_url, :image_id
  end
end
