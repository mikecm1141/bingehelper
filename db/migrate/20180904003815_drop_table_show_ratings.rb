class DropTableShowRatings < ActiveRecord::Migration[5.1]
  def change
    drop_table :show_ratings
  end
end
