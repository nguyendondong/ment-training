json.extract! product, :id, :name, :sku, :description, :meta_description, :meta_keywords, :created_at, :updated_at
json.url product_url(product, format: :json)
