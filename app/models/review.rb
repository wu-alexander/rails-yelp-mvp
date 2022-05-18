class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true, message: "%{value} is not a number" }
  validates :rating, inclusion: { in: 0..5, message: "%{value} is not between 0 and 5" }
end
