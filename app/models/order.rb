class Order < ApplicationRecord
  validates :postal_code, length: {minimum:7, maximum:7}
  validates :delivery_address, presence: true, length: {maximum:300}
  validates :delivery_name, presence: true, length: {maximum:50}
  validates :method_of_payment, presence: true
  validates :status, presence: true
  validates :total_price, presence: true
  validates :delivery_charge, presence: true

  belongs_to :public, optional: true
  has_many :order_details, dependent: :destroy
  enum method_of_payment: { credit_card: 0, transfer: 1 }
  enum status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}
end
