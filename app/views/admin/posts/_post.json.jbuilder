json.extract! post, :id, :name, :status, :created_at, :updated_at
json.url post_url(post, format: :json)
