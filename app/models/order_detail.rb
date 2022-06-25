class OrderDetail < ApplicationRecord
  validates :quantity, presence: true
  validates :making_status, presence: true

  belongs_to :order, optional: true
  belongs_to :item, optional: true
end
