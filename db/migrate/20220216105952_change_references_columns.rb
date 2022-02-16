class ChangeReferencesColumns < ActiveRecord::Migration[6.1]
  def change
    remove_reference :bookmarks, :movies
    remove_reference :bookmarks, :lists
    add_reference :bookmarks, :movie
    add_reference :bookmarks, :list
  end
end
