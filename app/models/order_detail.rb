class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
  def subtotal
    (price*1.1).floor*quantity
  end
end
