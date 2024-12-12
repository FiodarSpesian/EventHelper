class RemoveCategoryIdUserIdFromEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :category_id, :integer
    remove_column :events, :user_id, :integer
  end
end
