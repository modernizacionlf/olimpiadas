class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :age, null: false
      t.belongs_to :institute, null: false, foreign_key: true

      t.timestamps
    end
  end
end
