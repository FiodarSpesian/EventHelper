class User < ApplicationRecord
  has_and_belongs_to_many :categories, dependent: :destroy
  has_many :events, dependent: :destroy

  after_save :create_default_categories

  has_secure_password
  validates :email, presence: true, uniqueness: true

  def create_default_categories
    categories = ['отдых', 'работа', 'личное']
    categories.each do |category|
    self.categories.find_or_create_by(name: category)
    end
  end
end
