class AddImageAndProfileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_image, :text
    add_column :users, :cover_image, :text
    add_column :users, :profile_text, :text
  end
end
