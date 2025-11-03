class AddSportToGames < ActiveRecord::Migration[8.0]
  def change
    add_reference :games, :sport, null: false, foreign_key: true
  end
end
