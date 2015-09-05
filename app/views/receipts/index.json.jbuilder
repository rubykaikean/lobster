json.array!(@receipts) do |receipt|
  json.extract! receipt, :id, :skey, :tran_id, :domain, :currency, :paydate, :orderid, :appcode, :error_code, :error_desc, :channel, :user_id
  json.url receipt_url(receipt, format: :json)
end
