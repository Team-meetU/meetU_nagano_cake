class CartItem < ApplicationRecord
  belongs_to :public, optional: true
  belongs_to :item, optional: true
  def subtotal
    item.add_tax_price * quantity
  end

  def add_tax_price
        (self.price * 1.10).round
  end
end
