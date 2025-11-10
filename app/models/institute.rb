class Institute < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :promos, dependent: :destroy

  validates :name, length: { maximum: 120 }, presence: true, uniqueness: true
  normalizes :name, with: ->(name) { name.strip.downcase }
end
