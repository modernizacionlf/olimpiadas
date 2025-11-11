class Activity < ApplicationRecord
  belongs_to :place
  belongs_to :activity_type
  belongs_to :student_team
end
