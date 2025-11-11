class Activity < ApplicationRecord
  belongs_to :place
  belongs_to :activity_type

  has_many :activity_teams, dependent: :destroy
  has_many :teams, through: :activity_teams, source: :student_team
end
