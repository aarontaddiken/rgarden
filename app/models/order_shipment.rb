class OrderShipment < ApplicationRecord
self.table_name = "order_shipment"
  belongs_to :order
end
