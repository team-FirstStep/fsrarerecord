class Select < ApplicationRecord

  belongs_to :product, optional: true
  belongs_to :cart

end

