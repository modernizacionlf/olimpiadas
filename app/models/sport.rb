class Sport < ApplicationRecord
  has_many :games, dependent: :destroy

  validates :name, length: { maximum: 80 }, presence: true

  normalizes :name, with: -> name { name.strip.downcase }
end
