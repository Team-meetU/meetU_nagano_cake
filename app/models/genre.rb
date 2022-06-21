class Genre < ApplicationRecord
  vaildates :name, presence: true, length: {maximum:20}

  belongs_to :item, optional: true
end
