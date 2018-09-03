class AddShowReferenceToRatings < ActiveRecord::Migration[5.1]
  def change
    add_reference :ratings, :show, foreign_key: true
  end
end
