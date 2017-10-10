json.extract! product_price, :id, :product_id, :billto_id, :retail, :cost, :seed_year, :created_at, :updated_at
json.url product_price_url(product_price, format: :json)
