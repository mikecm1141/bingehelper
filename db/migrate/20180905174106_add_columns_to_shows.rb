class AddColumnsToShows < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :overview, :text
  end
end
