class AddLogQuantityToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :log_quantity, :integer
  end
end
