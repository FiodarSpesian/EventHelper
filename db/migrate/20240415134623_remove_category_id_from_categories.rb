class RemoveCategoryIdFromCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :category_id, :string
  end
end
