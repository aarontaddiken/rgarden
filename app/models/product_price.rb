class ProductPrice < ApplicationRecord
  belongs_to :product
  belongs_to :billto
end
