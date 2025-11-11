class Student < ApplicationRecord
  belongs_to :promo

  has_many :activity_students, dependent: :destroy
  has_many :activities, through: :activity_students

  has_one_attached :image

  validates :first_name, :last_name, length: { maximum: 60 }, presence: true
  validates :age, numericality: { only_integer: true, in: 16..22 }, presence: true
  normalizes :first_name, :last_name, with: ->(e) { e.strip.downcase }

  def full_name
    "#{first_name} #{last_name}"
  end
end
