class Order < ApplicationRecord
    has_many :order_details
    has_many :order_items, through: :order_details, source: :item

    belongs_to :public
    enum method_of_payment: { credit_card: 0, transfer: 1 }

    attribute :user_address, :integer, default: 0
end
