json.array!(@molpay_transaction_histories) do |molpay_transaction_history|
  json.extract! molpay_transaction_history, :id, :amount, :status, :bill_name, :bill_email, :bill_mobile, :bill_desc, :tran_id, :domain, :currency, :paydate, :order_id, :appcode, :error_code, :error_desc, :channel, :sale_id
  json.url molpay_transaction_history_url(molpay_transaction_history, format: :json)
end
