class Address < ApplicationRecord
  #validates :postal_code, length: {minimum:7, maximum:7}
  #vaildates :address, presence: true
  #vaildates :name, presence: true, length: {maximum:50}

  belongs_to :public, optional: true
end
