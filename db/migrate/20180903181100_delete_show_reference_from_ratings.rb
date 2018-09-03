class DeleteShowReferenceFromRatings < ActiveRecord::Migration[5.1]
  def change
    remove_column :ratings, :show_id
  end
end
