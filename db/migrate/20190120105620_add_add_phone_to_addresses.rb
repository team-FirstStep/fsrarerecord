class AddAddPhoneToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :add_phone, :string
  end
end
