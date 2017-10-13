class DropOrderItemTable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :order_item
  end
end
