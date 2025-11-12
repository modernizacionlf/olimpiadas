class ActivityType < ApplicationRecord
  has_many :activities

  validates :name, length: { maximum: 15 }, presence: true
  normalizes :name, with: -> name { name.strip.downcase }
end
