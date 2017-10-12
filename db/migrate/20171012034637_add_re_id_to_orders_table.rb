class AddReIdToOrdersTable < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :rep_id, :integer
  end
end
