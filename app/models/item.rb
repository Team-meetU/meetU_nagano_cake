class Item < ApplicationRecord
  #vaildates :genre_id, presence: true
  #vaildates :name, presence: true, length: {maximum:100}
  #vaildates :explanation, presence: true, length: {maximum:999}
  #vaildates :price, presence: true
  #vaildates :is_stock, presence: true

  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details
  has_one :genre
  
  def add_tax_price
        (self.price * 1.10).round
  end
end
