class CreateStudentTeams < ActiveRecord::Migration[8.0]
  def change
    create_table :student_teams do |t|
      t.belongs_to :institute, null: false, foreign_key: true
      t.belongs_to :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
