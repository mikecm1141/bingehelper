class CreateShowGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :show_genres do |t|
      t.references :genre, foreign_key: true
      t.references :show, foreign_key: true
    end
  end
end
