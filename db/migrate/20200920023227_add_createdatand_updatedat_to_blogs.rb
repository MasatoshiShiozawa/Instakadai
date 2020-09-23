class AddCreatedatandUpdatedatToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :created_at, :datetime, null: false
    add_column :blogs, :updated_at, :datetime, null: false
  end
end
