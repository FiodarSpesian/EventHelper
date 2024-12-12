class CreateCategoriesUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :categories_users, id: false do |t|
      t.belongs_to :user, null: false
      t.belongs_to :category, null: false
    end
  end
end
