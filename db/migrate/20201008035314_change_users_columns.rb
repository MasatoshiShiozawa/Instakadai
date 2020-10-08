class ChangeUsersColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :firstname, :string
    remove_column :users, :cover_image, :text
  end
end
