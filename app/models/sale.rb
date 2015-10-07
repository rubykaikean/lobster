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
#  cash                   :string
#  government_loan        :string
#  staff_loan             :string
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
  has_many :payments
  has_one :molpay_transaction_history

  scope :confirmed, -> { where status_id: COMPLETED }

  # status
  PENDING = 1
  COMPLETED = 2
  REJECTED = 3
  CANCELLED = 4
  PENDING_RESERVATION = 5
  CONFIRM_RESERVATION = 6

  CASH = 1
  BANK_LOAN = 2
  GOVERNMENT_LOAN = 3
  STAFF_LOAN = 4

  def status
  	case status_id
    when PENDING
      "Pending"
    when BOOKED
      "Booked"
    when COMPLETED
      "completed"
    when REJECTED
      "Rejected"
    when CANCELLED
      "Cancelled"
    when PENDING_RESERVATION
      "Pending Reservation"
    when CONFIRM_RESERVATION
      "Confirm Reservation"
    end
  end

  def payment_type
    
  end

  def confirm_date_short_format
    confirm_date.strftime("%d/%m/%Y") rescue ""
  end

  def lot
    Lot.find_by(id: lot_unit_id)
  end

  def actual_price
    original_price = lot.selling_price
    if buyer.is_bumiputera? && lot.is_special_unit == false
      rate_total = original_price * bumiputera_discount / 100
      original_price -= rate_total
    else
      original_price
    end
  end

  def product_setting
    @setting ||= product.product_setting
  end

  def bumiputera_discount
    product_setting.bumiputera_discount || 7
  end


end
