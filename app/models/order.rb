class Order < ApplicationRecord
  #validates :postal_code, length: {minimum:7, maximum:7}
  #vaildates :delivery_address, presence: true, length: {maximum:300}
  #vaildates :delivery_name, presence: true, length: {maximum:50}
  #vaildates :method_of_payment, presence: true
  #vaildates :status, presence: true
  #vaildates :total_price, presence: true
  #vaildates :delivery_charge, presence: true

  belongs_to :public, optional: true
  has_many :order_details, dependent: :destroy
  enum method_of_payment: { credit_card: 0, transfer: 1 }
  enum delivery_address: { my_address: 1, registered_addresses: 2, new_address: 3 }
end
