class RemovePhoneFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :phone, :string
  end
end
