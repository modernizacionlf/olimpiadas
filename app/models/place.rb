class Place < ApplicationRecord
  has_many :activities

  validates :name, length: { maximum: 120 }, presence: true, uniqueness: true
  normalizes :name, with: -> name { name.strip.downcase }
end
