class AddsImageToShowsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :image, :string
  end
end
