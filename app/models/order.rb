class Order < ApplicationRecord
    has_many :order_details
    has_many :order_items, through: :order_details, source: :item

  belongs_to :public, optional: true
  has_many :order_details, dependent: :destroy
  enum method_of_payment: { credit_card: 0, transfer: 1 }
  enum status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}

    attribute :user_address, :integer, default: 0
end
