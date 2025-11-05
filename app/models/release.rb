class Release < ApplicationRecord
  has_one_attached :image

  validates :title, length: { minimum: 10, maximum: 80 }, presence: true
  validates :description, length: { minimum: 10, maximum: 500 }, presence: true

  normalizes :title, :description, with: -> (e) { e.strip.downcase }
end
