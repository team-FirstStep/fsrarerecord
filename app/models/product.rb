class Product < ApplicationRecord
  	attachment :image


	has_many :discs
	accepts_nested_attributes_for :discs, allow_destroy: true

	acts_as_paranoid

	has_many :selects
	before_destroy :referenced_by_select

	private
	def referenced_by_select

		if selects.empty?
			return true
		else
			errors.add(:base, '品目が存在します。')
			retuen false
		end
	end

end
