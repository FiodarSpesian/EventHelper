class Category < ApplicationRecord
  before_save :name_to_down
  validates :name, presence: true

  def name_to_down
    name.downcase!
  end
end
