class Select < ApplicationRecord
	belongs_to :cart
	belongs_to :product

	attachment :image

	validates: user_id
	presence: {if: '!user_id.nil?'}
end
