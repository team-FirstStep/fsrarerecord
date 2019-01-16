class Cart < ApplicationRecord
	has_many :selects, dependent: :detroy
end
