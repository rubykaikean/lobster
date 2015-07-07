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
#  confirm_date           :datetime
#  admin_confirm_user_id  :integer
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

  def confirm_date_short_format
    confirm_date.strftime("%d/%m/%Y") rescue ""
  end

  def lot
    Lot.find_by(id: lot_unit_id)
  end

  def confirm_sale(confirm_params)
    self.status_id = COMPLETED
    self.confirm_date = Time.current if confirm_date.nil?
    if self.update(confirm_params)
      if lot
        lot.status_id = Lot::SOLD
        lot.save
      end
    end
  end

  def actual_price
    if buyer.is_bumiputera?
      original_price = lot.selling_price
      rate_total = original_price * 7 / 100
      original_price -= rate_total
    else
      lot.selling_price
    end
  end


end
