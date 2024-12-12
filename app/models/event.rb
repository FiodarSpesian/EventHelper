class Event < ApplicationRecord
  belongs_to :user # пренадлежит User
  belongs_to :category

  paginates_per 5

  before_save
  validates :name, presence: true
  validates :event_date, presence: true
  validates :category_id, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["body", "category_id", "created_at", "event_date", "id", "id_value", "name", "updated_at", "user_id"]
  end

end
