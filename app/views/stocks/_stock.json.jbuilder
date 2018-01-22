json.extract! stock, :id, :name, :qty_in_market, :price, :market_id, :created_at, :updated_at
json.url stock_url(stock, format: :json)
