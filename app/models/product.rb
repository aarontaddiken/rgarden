class Product < ApplicationRecord
self.table_name = "product"
  belongs_to :company
  belongs_to :product_type
end
