json.array!(@molpay_transaction_histories) do |molpay_transaction_history|
  json.extract! molpay_transaction_history, :id, :order_id, :amount, :is_paid, :status, :bill_name, :bill_email, :bill_mobile
  json.url molpay_transaction_history_url(molpay_transaction_history, format: :json)
end
