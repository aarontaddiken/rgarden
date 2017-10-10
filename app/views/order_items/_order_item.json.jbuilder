json.extract! order_item, :id, :id, :order_id, :product_id, :qty_order, :qty_ship, :cost, :retail, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
