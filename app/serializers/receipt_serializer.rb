# == Schema Information
#
# Table name: receipts
#
#  id         :integer          not null, primary key
#  skey       :string
#  tran_id    :integer
#  domain     :string
#  currency   :string
#  paydate    :datetime
#  orderid    :string
#  appcode    :string
#  error_code :string
#  error_desc :string
#  channel    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_receipts_on_user_id  (user_id)
#

class ReceiptSerializer < ActiveModel::Serializer
  attributes :id, :skey, :tran_id, :domain, :currency, :paydate, :orderid, :appcode, :error_code, :error_desc, :channel, :user_id
end
