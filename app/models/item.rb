class Item < ApplicationRecord
  validates :genre_id, presence: true
  validates :name, presence: true, length: {maximum:100}
  validates :explanation, presence: true, length: {maximum:999}
  validates :price, presence: true
  validate :is_stock

  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details
  belongs_to :genre, optional: true

  #消費税を加えた商品価格
  def add_tax_price
        (self.price * 1.10).round
  end
end
