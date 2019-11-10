json.extract! payment, :id, :card_type, :card_no, :expiry_date, :cvv, :created_at, :updated_at
json.url payment_url(payment, format: :json)
