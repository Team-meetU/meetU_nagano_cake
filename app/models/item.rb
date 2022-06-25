class Item < ApplicationRecord
  validates :genre_id, presence: true
  validates :name, presence: true, length: {maximum:100}
  validates :explanation, presence: true, length: {maximum:999}
  validates :price, presence: true
  validate :is_stock

  has_one_attached :item_image
  has_many :cart_items, dependent: :destroy
  has_many :order_details

  belongs_to :genre, optional: true

 def get_item_image(width, height)
  unless item_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.png')
    item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  item_image.variant(resize_to_limit: [width, height]).processed
end
  #消費税を加えた商品価格

  def add_tax_price
        (self.price * 1.10).round
  end
end
