class AddCategoryRefToEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :category, null: false, foreign_key: true
  end
end
