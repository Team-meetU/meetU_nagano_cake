class CartItem < ApplicationRecord
  belongs_to :public, optional: true
  belongs_to :item, optional: true
  def subtotal
    item.add_tax_price * quantity
end
end
