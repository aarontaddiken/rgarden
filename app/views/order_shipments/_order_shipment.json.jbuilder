json.extract! order_shipment, :id, :order_id, :ship_date, :tracking_number, :created_at, :updated_at
json.url order_shipment_url(order_shipment, format: :json)
