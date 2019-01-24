class Cart < ApplicationRecord
	has_many :selects
    has_many :products, through: :selects
	before_destroy :referenced_by_select

	belongs_to :user

end
