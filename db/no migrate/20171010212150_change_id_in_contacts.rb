class ChangeIdInContacts < ActiveRecord::Migration[5.1]
  def change
  	change_column :contact, :id, :serial
  	change_column :order_item, :id, :serial
  	change_column :order_shipment, :id, :serial
  	change_column :orders, :id, :serial
  	change_column :product, :id, :serial
  	change_column :product_price, :id, :serial
  end
end
