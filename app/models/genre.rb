class Genre < ApplicationRecord
  validates :name, presence: true, length: {maximum:20}

  belongs_to :item, optional: true
end
