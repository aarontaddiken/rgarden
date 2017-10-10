json.extract! product, :id, :company_id, :name, :product_type_id, :upc, :sku, :product_type_value, :created_at, :updated_at
json.url product_url(product, format: :json)
