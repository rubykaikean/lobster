class SaleEngine

  def initialize(sale, related_params)
    @sale = sale
    @sold_lot = @sale.lot
    product = @sale.product
    @buyer = @sale.buyer
    @setting = product.product_setting
    @related_params = related_params
  end

  def confirm
    @sale.status_id = Sale::COMPLETED
    @sale.confirm_date = Time.current if @sale.confirm_date.nil?
    if @sale.update(@related_params)
      if @sold_lot
        @sold_lot.status_id = Lot::SOLD
        if @sold_lot.save
          reject_the_rest_of_sales_for_the_same_lot
        end
      end
    end
  end


  def reject
    @sale.status_id = Sale::REJECTED
    @sale.reject_reason = @related_params[:reject_reason]
    if @sale.save
      if @setting.allow_multiple_booking?
        pending_sale_unit = Sale.find_by(lot_unit_id: @sale.lot_unit_id, status_id: Sale::PENDING)
        if pending_sale_unit
          
        else
          @sold_lot.status_id = Lot::AVAILABLE
          @sold_lot.save
        end
      else
        @sold_lot.status_id = Lot::AVAILABLE
        @sold_lot.save
      end
    end
  end

  def cancel
    @sale.status_id = Sale::CANCELLED
    @sale.reject_reason = @related_params[:cancel_reason]
    if @sale.save
      @sold_lot.status_id = Lot::AVAILABLE
      @sold_lot.save
    end
  end

  def self.reserve(data)
    lot = data[:lot]
    setting = data[:setting]
    buyer = Buyer.new(data[:buyer_data])
    # sale = Sale.new(booking_fee: data[:booking_fee], cash: data[:cash], bank_loan: data[:bank_loan], government_loan: data[:government_loan], staff_loan: data[:staff_loan])
    sale = Sale.new(booking_fee: data[:booking_fee], payment_type_id: data[:payment_type_id])
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
        SalesNotifier.confirmation(sale.id).deliver_later unless buyer.email.blank? if setting.notify_buyer_on_sale_confirmation?
        SalesNotifier.inform_admins(sale.id).deliver_later if setting.notify_admin_on_sale_confirmation?
        result[:status] = 201
        result[:message] = "Lot #{lot.name} has been reserved successfully for #{buyer.full_name}."
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