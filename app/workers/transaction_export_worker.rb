class TransactionExportWorker

	include Sidekiq::Worker
  
	def perform(data, sale_id)
  sale = Sale.find(sale_id)
	
  booking = [{
          transaction_id: sale_id,
          full_name: data[:full_name],
          buyer_second_name: data[:buyer_second_name],
          buyer_third_name: data[:buyer_third_name],
          buyer_ic_number: data[:ic_number],
          second_buyer_ic_number: data[:second_ic_number],
          third_buyer_ic_number: data[:third_ic_number],
          buyer_address: data[:address],
          buyer_postcode: data[:postcode],
          booking_fee: data[:booking_fee],
          car_park_unit: data[:car_park],
          payment_type: sale.payment_type,
          lot_number: data[:lot].name,
          selling_price: data[:lot].selling_price,
          cheque_number: data[:cheque_number],
          transaction_number: data[:transaction_number]
        }]
        # http://117.53.153.87:8889/postprebook >> testing
    # result = RestClient.post "http://117.53.153.87:8800/postprebook", {"booking": [{"transaction_id": "1231", "full_name": "asdasd","buyer_second_name": "ddffdgd","buyer_third_name": "rteryey", "buyer_ic_number": "75675675","second_buyer_ic_number": "453453", "third_buyer_ic_number": "2342342","buyer_address": "asdasdafsdgger", "buyer_postcode": "4142342","booking_fee": "1241342", "car_park_unit": "1241","payment_type": "testing", "lot_number": "12qwedawq","selling_price": "124342", "cheque_number": "353453", "transaction_number": "qrqerqeadfad"}]}.to_json, :content_type => :json, :accept => :json
    result = RestClient.post "http://117.53.153.87:8800/postprebook", booking.to_json, :content_type => :json, :accept => :json
    doc = JSON.parse result
    # doc.class
    if doc["PostPrebook_response"]["Result"]["BookingSuccess"].to_i == 0
      SalesNotifier.inform_api_transfer_fail(sale_id).deliver_now
      logger.info "this email side!"
    end
    logger.info {booking}
	end


end