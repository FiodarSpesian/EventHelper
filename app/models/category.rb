class Category < ApplicationRecord
  has_and_belongs_to_many :users

  before_save :name_to_down
  validates :name, presence: true

  def name_to_down
    name.downcase!
  end
end
