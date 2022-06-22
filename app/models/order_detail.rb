class OrderDetail < ApplicationRecord
  #vaildates :quantity, presence: true
  #vaildates :making_status, presence: true

  belongs_to :order, optional: true
  belongs_to :item, optional: true
end
