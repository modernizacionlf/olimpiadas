class CreatePlaces < ActiveRecord::Migration[8.0]
  def change
    create_table :places do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :places, :name,  unique: true
  end
end
