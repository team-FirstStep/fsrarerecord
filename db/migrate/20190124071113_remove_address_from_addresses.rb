class RemoveAddressFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :address, :string
  end
end
