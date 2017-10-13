class Product < ApplicationRecord
self.table_name = "product"
  belongs_to :contact, class_name: "Contact", foreign_key: "company_id"
  has_many :order_items, foreign_key: "product_id"
end
