class Item < ApplicationRecord
  validates :genre_id, presence: true
  validates :name, presence: true, length: {maximum:100}
  validates :explanation, presence: true, length: {maximum:999}
  validates :price, presence: true
  validates :is_stock, presence: true

  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details
  has_one :genre
end
