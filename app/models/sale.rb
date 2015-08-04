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

  scope :confirmed, -> { where status_id: COMPLETED }

  # status
  PENDING = 1
  COMPLETED = 2
  REJECTED = 3
  CANCELLED = 4

  def status
  	case status_id
    when PENDING
      "Pending"
    when COMPLETED
      "completed"
    when REJECTED
      "Rejected"
    when CANCELLED
      "Cancelled"
    end
  end

  def confirm_date_short_format
    confirm_date.strftime("%d/%m/%Y") rescue ""
  end

  def lot
    Lot.find_by(id: lot_unit_id)
  end

  # def confirm_sale(confirm_params)
  #   self.status_id = COMPLETED
  #   self.confirm_date = Time.current if confirm_date.nil?
  #   if self.update(confirm_params)
  #     sold_lot = self.lot
  #     if sold_lot
  #       sold_lot.status_id = Lot::SOLD
  #       if sold_lot.save
          
  #         setting = product.product_setting
  #         SalesNotifier.confirmation(self.id).deliver_later unless buyer.email.blank? if setting.notify_buyer_on_sale_confirmation?
  #         SalesNotifier.inform_admins(self.id).deliver_later if setting.notify_admin_on_sale_confirmation?
  #       end
  #     end
  #   end
  # end

  def actual_price
    original_price = lot.selling_price
    if buyer.is_bumiputera?
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
