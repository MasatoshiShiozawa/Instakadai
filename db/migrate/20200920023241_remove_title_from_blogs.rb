class RemoveTitleFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :title, :string
  end
end
