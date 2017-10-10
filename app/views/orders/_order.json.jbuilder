json.extract! order, :id, :ponum, :order_date, :request_ship_date, :invoice_date, :total, :note, :contact_id, :seed_year, :created_at, :updated_at
json.url order_url(order, format: :json)
