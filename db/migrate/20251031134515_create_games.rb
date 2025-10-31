class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.belongs_to :game_instance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
