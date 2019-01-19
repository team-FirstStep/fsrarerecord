class RemoveJacketImgFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :jacket_img, :text
  end
end
