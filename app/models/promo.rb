class Promo < ApplicationRecord
  belongs_to :institute
  has_many :students

  has_one_attached :logo
end
