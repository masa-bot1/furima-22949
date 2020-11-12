class Purchase < ApplicationRecord
  has_one :address
  belongs_to :item
end
