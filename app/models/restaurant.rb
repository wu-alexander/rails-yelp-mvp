class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  before_validation :sanitize_category

  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: %w(chinese italian japanese french belgian), message: "%{value} is not a valid category" }

  private

  def sanitize_category
    self.category = category.downcase
  end
end
