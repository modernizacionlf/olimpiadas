class CreatePromos < ActiveRecord::Migration[8.0]
  def change
    create_table :promos do |t|
      t.belongs_to :institute, null: false, foreign_key: true

      t.timestamps
    end
  end
end
