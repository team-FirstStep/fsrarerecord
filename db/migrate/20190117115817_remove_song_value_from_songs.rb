class RemoveSongValueFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :song_value, :integer
  end
end
