class Cultural < ApplicationRecord
  has_one_attached :image

  validates :title, length: { minimum: 10, maximum: 150 }, presence: true
  validates :description, length: { minimum: 10, maximum: 4000 }, presence: true

  normalizes :title, :description, with: ->(e) { e.strip.downcase }
end
