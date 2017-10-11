class Product < ApplicationRecord
self.table_name = "product"
  belongs_to :contact, class_name: "Contact", foreign_key: "company_id"
  belongs_to :product_type
end
