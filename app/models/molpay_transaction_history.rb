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

class MolpayTransactionHistory < ActiveRecord::Base

	validates :order_id, uniqueness: true

	
end
