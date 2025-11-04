class AddViewsToRelease < ActiveRecord::Migration[8.0]
  def change
    add_column :releases, :views, :integer, default: 0
  end
end
