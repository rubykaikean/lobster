# == Schema Information
#
# Table name: sales
#
#  id                     :integer          not null, primary key
#  project_id             :integer
#  product_id             :integer
#  lot_unit_id            :integer
#  phase_id               :integer
#  user_id                :integer
#  status_id              :integer          default(1)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  buyer_id               :integer
#  downpayment            :integer
#  downpayment_percentage :integer
#  bank_loan              :string
#  spa                    :string
#  booking_fee            :integer
#  reject_reason          :string
#  downpayment_type       :string
#
# Indexes
#
#  index_sales_on_buyer_id     (buyer_id)
#  index_sales_on_lot_unit_id  (lot_unit_id)
#  index_sales_on_phase_id     (phase_id)
#  index_sales_on_product_id   (product_id)
#  index_sales_on_project_id   (project_id)
#  index_sales_on_status_id    (status_id)
#  index_sales_on_user_id      (user_id)
#

class Sale < ActiveRecord::Base
  belongs_to :buyer
  belongs_to :user
  belongs_to :product
  belongs_to :project
  belongs_to :phase
  belongs_to :lot_unit

  # status
  PENDING = 1
  COMPLETED = 2
  REJECTED = 3

  def status
  	case status_id
    when PENDING
      "Pending"
    when COMPLETED
      "completed"
    when REJECTED
      "Rejected"
    end
  end

  def lot
    if product.type_id == Product::LANDED
      Lot.find(lot_unit_id)
    else

    end
  end

  def self.confirm_sale(confirm_params)
    s = Sale.find(confirm_params[:sale_id])
    s.status_id = COMPLETED
    s.downpayment = confirm_params[:downpayment]
    s.downpayment_percentage = confirm_params[:downpayment_percentage]
    s.bank_loan = confirm_params[:bank_loan]
    s.downpayment_type = confirm_params[:downpayment_type]
    s.spa = confirm_params[:spa]
    s.user_id = confirm_params[:user_id] if confirm_params[:user_id]
    
    if s.save
      # Sale.reject_sale_same_record(s)
      lot = Lot.find(s.lot_unit_id)
      lot.status_id = Lot::SOLD
      lot.save
    end
  end

  #for tempo
  def bumi_putera_price
    
    lot = Lot.find(lot_unit_id)
    if lot.selling_price
      rate_total = lot.selling_price * 7 / 100
      lot.selling_price -= rate_total
    end
  end


end
