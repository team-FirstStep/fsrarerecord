class Cart < ApplicationRecord
	has_many :selects
    has_many :products, through: :selects
	before_destroy :referenced_by_select

    has_one :orders

	belongs_to :user

end
