class ProductPrice < ApplicationRecord
self.table_name = "product_price"
  belongs_to :product
  belongs_to :contact, foreign_key: "billto_id"
end
