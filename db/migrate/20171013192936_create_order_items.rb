class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true, column: :product_id
      t.integer :qty_order
      t.integer :qty_ship
      t.numeric :cost
      t.numeric :retail

      t.timestamps
    end
  end
end
