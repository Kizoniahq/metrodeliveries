json.extract! order, :id, :type, :address, :city, :state, :country, :paid, :shipment_fee, :weight, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
