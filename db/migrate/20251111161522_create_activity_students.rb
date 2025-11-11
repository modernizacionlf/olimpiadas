class CreateActivityStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :activity_students do |t|
      t.belongs_to :activity, null: false, foreign_key: true
      t.belongs_to :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
