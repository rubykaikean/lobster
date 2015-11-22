class TransactionExportWorker

	include Sidekiq::Worker
  
	def perform(data)

		booking = {
          transaction_id: sale.id,
          full_name: sale.buyer.full_name,
          buyer_second_name: sale.buyer.buyer_second_name,
          buyer_third_name: sale.buyer.buyer_third_name,
          buyer_ic_number: sale.buyer.ic_number,
          second_buyer_ic_number: sale.buyer.second_ic_number,
          third_buyer_ic_number: sale.buyer.third_ic_number,
          buyer_address: sale.buyer.address,
          buyer_postcode: sale.buyer.postcode,
          booking_fee: sale.booking_fee,
          car_park_unit: sale.buyer.car_park,
          payment_type: sale.payment_type,
          lot_number: lot.name,
          selling_price: lot.selling_price,
          cheque_number: sale.cheque_number,
          transaction_number: sale.transaction_number
        }
      result = RestClient.post "http://117.53.153.87:8889/postprebook", booking.to_json, :content_type => :json, :accept => :json

	end


end