class Order < ApplicationRecord
self.table_name = "orders"
  belongs_to :contact
  has_many :order_shipments

  def customers
  	self.where(contact_id: 4)  	
  end
end
