class Select < ApplicationRecord
	belongs_to :cart
	belongs_to :product

	attachment :image
end
