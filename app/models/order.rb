class Order < ApplicationRecord
self.table_name = "orders"
  belongs_to :contact
  has_many :order_shipments
end
