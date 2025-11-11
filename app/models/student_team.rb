class StudentTeam < ApplicationRecord
  belongs_to :institute
  belongs_to :student
end
