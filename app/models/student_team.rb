class StudentTeam < ApplicationRecord
  belongs_to :institute
  belongs_to :student

  has_many :activity_teams, dependent: :destroy
  has_many :activities, through: :activity_teams, source: :activity
end
