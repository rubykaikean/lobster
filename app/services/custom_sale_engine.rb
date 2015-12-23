class CustomSaleEngine

  def initialize(sale, related_params)
    @sale = sale
    @sold_lot = @sale.lot
    product = @sale.product
    @buyer = @sale.buyer
    @setting = product.product_setting
    # @related_params = related_params
  end

  # def confirm
  #   @sale.status_id = Sale::COMPLETED
  #   @sale.confirm_date = Time.current if @sale.confirm_date.nil?
  #   if @sale.update(@related_params)
  #     if @sold_lot
  #       @sold_lot.status_id = Lot::SOLD
  #       if @sold_lot.save
  #         reject_the_rest_of_sales_for_the_same_lot
  #       end
  #     end
  #   end
  # end

  def self.reserve(data)
    lot = data[:lot]
    setting = data[:setting]
    buyer = Buyer.new(data[:buyer_data])    
    sale = Sale.new(booking_fee: data[:booking_fee], 
                    payment_type_id: data[:payment_type_id],
                    cheque_number: data[:cheque_number], 
                    transaction_number: data[:transaction_number])
    result = {}
    if lot.available_for_booking?
      if buyer.save
        lot.status_id = Lot::RESERVED
        lot.save
        
        sale.lot_unit_id = lot.id
        sale.product_id = lot.product_id
        sale.phase_id = lot.product.phase_id
        sale.project_id = lot.product.phase.project_id
        sale.user_id = data[:user_id]
        sale.buyer_id = buyer.id
        sale.status_id = Sale::PENDING
        sale.save
        if data[:payment_image]
          data[:payment_image].each do |file|
            if !file.nil?
              payment = sale.payments.new
              payment.image = file
              payment.save
            end
          end
        end
        SalesNotifier.confirmation(sale.id).deliver_now unless buyer.email.blank? if setting.notify_buyer_on_sale_confirmation?
        SalesNotifier.inform_admins(sale.id).deliver_now if setting.notify_admin_on_sale_confirmation?
        SalesNotifier.inform_agents(sale.id).deliver_now if setting.notify_agent_on_booking_unit?
        
        TransactionExportWorker.perform_async(data, sale.id)
        
        result[:status] = 201
        result[:message] = "Lot #{lot.name} has been reserved successfully for #{buyer.full_name}. And had been updated to eversolf"
      else
        result[:status] = 400
        result[:buyer] = buyer
        result[:sale] = sale
        result[:message] = buyer.errors.full_messages.join("<br>")
      end
    else
      result[:status] = 403
      result[:message] = "Lot #{lot.name} is already reserved."
    end
    result
  end


  # def testing(data, sale_id)
  #   sale = Sale.find(sale.id)
  #   booking = {
  #           transaction_id: sale_id,
  #           full_name: data[:full_name],
  #           buyer_second_name: data[:buyer_second_name],
  #           buyer_third_name: data[:buyer_third_name],
  #           buyer_ic_number: data[:ic_number],
  #           second_buyer_ic_number: data[:second_ic_number],
  #           third_buyer_ic_number: data[:third_ic_number],
  #           buyer_address: data[:address],
  #           buyer_postcode: data[:postcode],
  #           booking_fee: data[:booking_fee],
  #           car_park_unit: data[:car_park],
  #           payment_type: sale.payment_type,
  #           lot_number: data[:lot].name,
  #           selling_price: data[:lot].selling_price,
  #           cheque_number: data[:cheque_number],
  #           transaction_number: data[:transaction_number]
  #         }
  #         # http://117.53.153.87:8889/postprebook >> testing
  #     # result = RestClient.post "http://117.54.153.87:8800", {"booking": {"transaction_id": "123","full_name": "admin"}}.to_json, :content_type => :json, :accept => :json
  #     result = RestClient.post "http://117.54.153.87:8800/postprebook", booking.to_json, :content_type => :json, :accept => :json
  #     doc = JSON.parse result
  #     # doc.class
  #     if doc["PostPrebook_response"]["Result"]["BookingSuccess"].to_i == 0
  #       SalesNotifier.inform_api_transfer_fail(sale_id).deliver_now
  #       logger.info "this email side!"
  #     end
  #     logger.info {booking}
  # end



  private

  def reject_the_rest_of_sales_for_the_same_lot
    rejected_sales = Sale.where(lot_unit_id: @sold_lot.id, status_id: Sale::PENDING).where.not(id: @sale.id)
    rejected_sales.each do |sale|
      sale.status_id = Sale::REJECTED
      sale.reject_reason = "The lot has been confirmed by other buyer."
      sale.save
    end
  end


end