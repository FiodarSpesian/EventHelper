class Event < ApplicationRecord
  belongs_to :user # пренадлежит User

  before_save
  validates :name, presence: true
  validates :event_date, presence: true
  validates :category, presence: true

end
