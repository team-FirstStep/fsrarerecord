class RemoveZipFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :zip, :string
  end
end
