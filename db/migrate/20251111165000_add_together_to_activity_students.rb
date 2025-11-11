class AddTogetherToActivityStudents < ActiveRecord::Migration[8.0]
  def change
    add_column :activity_students, :together, :boolean, default: false
  end
end
