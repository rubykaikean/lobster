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
#  slug                  :string
#  sources_type_id       :integer
#  race                  :integer
#  age                   :integer
#  region_id             :integer
#
# Indexes
#
#  index_buyers_on_region_id        (region_id)
#  index_buyers_on_slug             (slug) UNIQUE
#  index_buyers_on_sources_type_id  (sources_type_id)
#

require "test_helper"

describe Buyer do
  let(:buyer) { Buyer.new }

  it "must be valid" do
    buyer.must_be :valid?
  end
end
