class RemoveStockFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :stock, :integer
  end
end
