class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :body
      t.date :event_date
      t.integer :category_id, index: true
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
