class RemoveGenreFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :genre, :integer
  end
end
