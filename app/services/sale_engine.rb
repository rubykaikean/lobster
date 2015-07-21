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
          SalesNotifier.confirmation(@sale.id).deliver_later unless @buyer.email.blank? if @setting.notify_buyer_on_sale_confirmation?
          SalesNotifier.inform_admins(@sale.id).deliver_later if @setting.notify_admin_on_sale_confirmation?
        end
      end
    end
  end

  def reject
    @sale.status_id = Sale::REJECTED
    @sale.reject_reason = @related_params[:reject_reason]
    if @sale.save
      if @setting.allow_multiple_booking?

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