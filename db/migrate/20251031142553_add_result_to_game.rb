class AddResultToGame < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :result_a, :integer
    add_column :games, :result_b, :integer
  end
end
