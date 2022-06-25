class Address < ApplicationRecord
  validates :postal_code, length: {minimum:7, maximum:7}
  validates :address, presence: true
  validates :name, presence: true, length: {maximum:50}

  belongs_to :public, optional: true
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
　end
end
end