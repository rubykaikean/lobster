# == Schema Information
#
# Table name: buyers
#
#  id                    :integer          not null, primary key
#  full_name             :string
#  ic_number             :string
#  address               :text
#  mobile_contact_number :string
#  home_contact_number   :string
#  office_contact_number :string
#  email                 :string
#  status_id             :integer
#  sale_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_buyers_on_sale_id  (sale_id)
#

require "test_helper"

describe Buyer do
  let(:buyer) { Buyer.new }

  it "must be valid" do
    buyer.must_be :valid?
  end
end
