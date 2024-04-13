class RemoveCategoryIdFromEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :category_id, :integer
  end
end
