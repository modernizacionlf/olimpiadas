class AddGameAndCulturalToActivity < ActiveRecord::Migration[8.0]
  def change
    add_reference :activities, :game, null: true, foreign_key: true
    add_reference :activities, :cultural, null: true, foreign_key: true
  end
end
