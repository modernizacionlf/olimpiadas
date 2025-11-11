class ActivityTeam < ApplicationRecord
  belongs_to :activity
  belongs_to :student_team
end
