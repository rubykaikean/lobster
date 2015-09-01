class SaleConfirmReservation

	def initialize(lot_unit_id, sale_id)
		@lot_unit_id = lot_unit_id
		@sale_id = sale_id
	end

	def sale_confirm_and_pending_reservation
    lot = Lot.find(@lot_unit_id)
    sale = Sale.find(@sale_id)
    if lot
	    lot.status_id = Lot::CONFIRM_RESERVATION
	    sale.status_id = Sale::CONFIRM_RESERVATION
	    if lot.save && sale.save  
	      pending_reservation_sale
	    end
	  end
	end

	private

	def pending_reservation_sale
		pending_sales = Sale.where(lot_unit_id: @lot_unit_id, status_id: Sale::PENDING).where.not(id: @sale_id)
      pending_sales.each do |p|
        p.status_id = Sale::PENDING_RESERVATION
        p.save
      end
  end
end