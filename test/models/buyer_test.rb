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
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  gender                :integer
#  age                   :integer
#  region                :string
#  race                  :string
#  sources               :string
#  slug                  :string
#
# Indexes
#
#  index_buyers_on_slug  (slug) UNIQUE
#

require "test_helper"

describe Buyer do
  let(:buyer) { Buyer.new }

  it "must be valid" do
    buyer.must_be :valid?
  end
end
