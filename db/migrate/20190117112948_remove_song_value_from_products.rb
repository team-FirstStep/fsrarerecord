class RemoveSongValueFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :song_value, :integer
  end
end
