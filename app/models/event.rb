class Event < ApplicationRecord

  before_save
  validates :name, presence: true
  validates :event_date, presence: true
  validates :category_id, presence: true

end
