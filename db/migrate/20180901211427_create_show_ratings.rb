class CreateShowRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :show_ratings do |t|
      t.references :show, foreign_key: true
      t.references :rating, foreign_key: true
    end
  end
end
