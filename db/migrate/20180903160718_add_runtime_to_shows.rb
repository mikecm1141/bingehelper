class AddRuntimeToShows < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :runtime, :integer
  end
end
