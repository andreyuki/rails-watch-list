class AddIndexToBookmark < ActiveRecord::Migration[7.1]
  def change
    add_index :bookmarks, [:list_id, :movie_id], unique: true
  end
end
