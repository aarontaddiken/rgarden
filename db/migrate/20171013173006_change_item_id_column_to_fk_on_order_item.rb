class ChangeItemIdColumnToFkOnOrderItem < ActiveRecord::Migration[5.1]
  def change_column
  	change_column :order_item, :id, :bigint
  end
end
