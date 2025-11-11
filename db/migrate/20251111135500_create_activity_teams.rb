class CreateActivityTeams < ActiveRecord::Migration[8.0]
  def change
    create_table :activity_teams do |t|
      t.belongs_to :activity, null: false, foreign_key: true
      t.belongs_to :student_team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
