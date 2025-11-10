class Promo < ApplicationRecord
  belongs_to :institute
  has_many :students
end
