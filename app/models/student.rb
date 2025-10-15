class Student < ApplicationRecord
  belongs_to :institute
  validates :first_name, :last_model, length: { maximum: 60 }, presence: true
  validates :age, numericality: { only_integer: true, in: 16..22 }
  normalizes :first_name, :last_model, with: ->(e) { e.strip.downcase }

  def full_name
    "#{first_name} #{last_name}"
  end
end
