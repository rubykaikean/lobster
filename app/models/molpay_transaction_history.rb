# == Schema Information
#
# Table name: molpay_transaction_histories
#
#  id          :integer          not null, primary key
#  amount      :float
#  status      :integer
#  bill_name   :string
#  bill_email  :string
#  bill_mobile :string
#  bill_desc   :string
#  tran_id     :integer
#  domain      :string
#  currency    :string
#  paydate     :datetime
#  order_id    :string
#  appcode     :string
#  error_code  :string
#  error_desc  :string
#  channel     :string
#  skey        :string
#  sale_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_molpay_transaction_histories_on_sale_id  (sale_id)
#

class MolpayTransactionHistory < ActiveRecord::Base

	belongs_to :sale

	validates :order_id, :sale_id, uniqueness: true


	SUCCESS = 00
	FAILURE = 11
	PENDING = 22

end
