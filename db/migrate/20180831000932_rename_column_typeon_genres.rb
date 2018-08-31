class RenameColumnTypeonGenres < ActiveRecord::Migration[5.1]
  def change
    rename_column :genres, :type, :title
  end
end
