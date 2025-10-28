class Release < ApplicationRecord
  validates :title, length: { minimum: 10, maximum: 80 }, presence: true

  normalizes :title, :description, with: -> (e) { e.strip.downcase }
end
