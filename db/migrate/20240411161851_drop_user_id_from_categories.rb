class DropUserIdFromCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :user_id
  end
end
