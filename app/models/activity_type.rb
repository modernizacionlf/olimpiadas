class ActivityType < ApplicationRecord
  validates :name, length: { maximum: 15 }, presence: true
  normalizes :name, with: -> name { name.strip.downcase }
end
