# == Schema Information
#
# Table name: payments
#
#  id                 :integer          not null, primary key
#  sale_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  cheque_number      :string
#  transaction_number :string
#

require "test_helper"

describe Payment do
  let(:payment) { Payment.new }

  it "must be valid" do
    payment.must_be :valid?
  end
end
