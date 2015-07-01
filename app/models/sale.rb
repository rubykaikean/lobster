# == Schema Information
#
# Table name: sales
#
#  id                       :integer          not null, primary key
#  project_id               :integer
#  product_id               :integer
#  lot_unit_id              :integer
#  phase_id                 :integer
#  user_id                  :integer
#  status_id                :integer          default(1)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  buyer_id                 :integer
#  downpayment              :integer
#  downpayment_percentage   :integer
#  bank_loan                :string
#  spa                      :string
#  booking_fee              :integer
#  reject_reason            :string
#  downpayment_type         :string
#  confirm_date             :datetime
#  purchaser_name           :string
#  purchaser_address        :text
#  purchaser_ic_number      :string(15)
#  purchaser_contact_number :string(15)
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
    if product.type_id == Product::LANDED
      Lot.find_by(id: lot_unit_id)
    else

    end
  end

  def confirm_sale(confirm_params)
    self.status_id = COMPLETED
    self.confirm_date = Time.current if confirm_date.nil?
    if self.update(confirm_params)
      # Sale.reject_sale_same_record(s)
      if lot
        lot.status_id = Lot::SOLD
        lot.save
      end
    end
  end

  #for tempo
  def bumi_putera_price
    if lot && lot.selling_price.present?
      rate_total = lot.selling_price * 7 / 100
      lot.selling_price -= rate_total
    end
  end


end
