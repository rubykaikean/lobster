class TransactionExportWorker

	include Sidekiq::Worker
  
	def perform(data, sale_id)
  sale = Sale.find(sale_id)
	booking = {
          transaction_id: sale_id,
          full_name: buyer_data[:full_name],
          buyer_second_name: buyer_data[:buyer_second_name],
          buyer_third_name: buyer_data[:buyer_third_name],
          buyer_ic_number: buyer_data[:ic_number],
          second_buyer_ic_number: buyer_data[:second_ic_number],
          third_buyer_ic_number: buyer_data[:third_ic_number],
          buyer_address: buyer_data[:address],
          buyer_postcode: buyer_data[:postcode],
          booking_fee: buyer_data[:booking_fee],
          car_park_unit: buyer_data[:car_park],
          payment_type: sale.payment_type,
          lot_number: data[:lot].name,
          selling_price: data[:lot].selling_price,
          cheque_number: data[:cheque_number],
          transaction_number: data[:transaction_number]
        }
    #  = RestClient.post "http://117.53.153.87:8889/postprebook", {"booking": [{"transaction_id": "123","full_name": "admin"}]}.to_json, :content_type => :json, :accept => :json
    result = RestClient.post "http://117.53.153.87:8889/postprebook", booking.to_json, :content_type => :json, :accept => :json
    doc = JSON.parse result
    # doc.class
    unless doc["PostPrebook_response"]["Result"]["BookingSuccess"] == 1
      SalesNotifier.inform_api_transfer_fail(sale_id).deliver_now
    end
	end


end