# == Schema Information
#
# Table name: molpay_transaction_histories
#
#  id          :integer          not null, primary key
#  order_id    :integer
#  amount      :float
#  is_paid     :boolean
#  status      :boolean
#  bill_name   :string
#  bill_email  :string
#  bill_mobile :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "test_helper"

describe MolpayTransactionHistory do
  let(:molpay_transaction_history) { MolpayTransactionHistory.new }

  it "must be valid" do
    molpay_transaction_history.must_be :valid?
  end
end
