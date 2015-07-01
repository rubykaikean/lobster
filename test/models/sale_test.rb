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

require "test_helper"

describe Sale do
  let(:sale) { Sale.new }

  it "must be valid" do
    sale.must_be :valid?
  end
end
