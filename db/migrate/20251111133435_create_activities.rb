class CreateActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :activities do |t|
      t.date :date_of
      t.time :start_at
      t.time :end_at
      t.belongs_to :place, null: false, foreign_key: true
      t.belongs_to :activity_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
