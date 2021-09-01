json.extract! transaction, :id, :payer, :points, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
