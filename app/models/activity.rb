class Activity < ApplicationRecord
  belongs_to :place
  belongs_to :activity_type
  belongs_to :game, optional: true
  belongs_to :cultural, optional: true

  has_many :activity_students, dependent: :destroy
  has_many :students, through: :activity_students

  validates :date_of, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :start_before_end

  normalizes :place, :activity_type, with: ->(e) { e.strip.downcase }

  def start_before_end
    if start_at && end_at && start_at >= end_at
      errors.add(:end_at, 'debe terminar despues del inicio')
    end
  end
end
