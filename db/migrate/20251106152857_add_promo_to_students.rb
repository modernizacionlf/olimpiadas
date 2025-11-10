class AddPromoToStudents < ActiveRecord::Migration[8.0]
  def change
    add_reference :students, :promo, null: false, foreign_key: true
  end
end
