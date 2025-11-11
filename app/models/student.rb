class Student < ApplicationRecord
  belongs_to :institute
  belongs_to :promo

  has_many :student_teams, dependent: :destroy
  has_many :teams, through: :student_teams, source: :institute

  has_one_attached :image

  validates :first_name, :last_name, length: { maximum: 60 }, presence: true
  validates :age, numericality: { only_integer: true, in: 16..22 }, presence: true
  normalizes :first_name, :last_name, with: ->(e) { e.strip.downcase }

  def full_name
    "#{first_name} #{last_name}"
  end
end
