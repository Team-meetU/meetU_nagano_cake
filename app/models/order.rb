class Order < ApplicationRecord
  validates :postal_code, length: {minimum:7, maximum:7}
  vaildates :delivery_address, presence: true, length: {maximum:300}
  vaildates :delivery_name, presence: true, length: {maximum:50}
  vaildates :method_of_payment, presence: true
  vaildates :status, presence: true
  vaildates :total_price, presence: true
  vaildates :delivery_charge, presence: true

  belongs_to :public, optional: true
  has_many :order_details, dependent: :destroy
end
