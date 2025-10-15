class CreateInstitutes < ActiveRecord::Migration[8.0]
  def change
    create_table :institutes do |t|
      t.string :name

      t.timestamps
    end
    add_index :institutes, :name, unique: true
  end
end
