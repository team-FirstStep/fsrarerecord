class Cart < ApplicationRecord
	has_many :selects
	belongs_to :user

end
