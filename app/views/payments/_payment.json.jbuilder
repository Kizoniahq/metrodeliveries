json.extract! payment, :id, :amount, :first_name, :last_name, :payment_method, :order_id, :user_id, :email, :created_at, :updated_at
json.url payment_url(payment, format: :json)
