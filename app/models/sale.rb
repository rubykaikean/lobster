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
#  downpayment_type       :integer
#  bank_loan              :string
#  spa                    :string
#  booking_fee            :integer
#  reject_reason          :string
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

  def self.confirm_sale(params)
    @sale_id = params[:sale_id]
    s = Sale.find(params[:sale_id])
    s.status_id = 2
    s.downpayment = params[:downpayment]
    s.downpayment_percentage = params[:downpayment_percentage]
    s.bank_loan = params[:bank_loan]
    s.downpayment_type = params[:downpayment_type]
    s.spa = params[:spa]
    Sale.reject_sale_same_record(s)
    s.save!
    Sale.lot_unit_sold
  end

  def self.lot_unit_sold
    a = Sale.find(@sale_id)
    lot = Lot.find(a.lot_unit_id)
    lot.status_id = 3
    lot.save!
  end

  def self.reject_sale_same_record(s)
    p = Sale.where("lot_unit_id = ?", s.lot_unit_id)
    if p
      p.each do |t|
        if t.status_id = 1
          t.status_id = 3
          t.save!
        end
      end
    end
  end

end
