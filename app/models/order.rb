class Order < ApplicationRecord
self.table_name = "orders"
  belongs_to :contact
  has_many :order_items, dependent: :destroy

  accepts_nested_attributes_for :order_items, :reject_if => lambda { |a| a[:product_id].blank? }

  def customers
  	self.where(contact_id: 4)  	
  end
end
