class AddUniqueIndexToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_index :bookmarks, %i[movie_id list_id], unique: true
  end
end
