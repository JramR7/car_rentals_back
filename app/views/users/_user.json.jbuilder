json.extract! user, :id, :name, :phone, :email, :id_document, :address, :created_at, :updated_at
json.url user_url(user, format: :json)
