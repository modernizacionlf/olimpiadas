class AddDelegateToStudents < ActiveRecord::Migration[8.0]
  def change
    add_column :students, :delegate, :boolean, default: false
  end
end
