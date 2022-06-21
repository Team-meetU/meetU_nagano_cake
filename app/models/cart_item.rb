class CartItem < ApplicationRecord
  belongs_to :public, optional: true
  belongs_to :item, optional: true
end
