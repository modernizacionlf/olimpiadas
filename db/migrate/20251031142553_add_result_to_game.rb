class AddResultToGame < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :result_a, :integer, default: 0
    add_column :games, :result_b, :integer, default: 0
  end
end
