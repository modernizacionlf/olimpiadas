class Institute < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :promos, dependent: :destroy

  has_many :student_teams, dependent: :destroy
  has_many :teams, through: :student_teams, source: :student

  validates :name, length: { maximum: 120 }, presence: true, uniqueness: true
  normalizes :name, with: ->(name) { name.strip.downcase }
end
