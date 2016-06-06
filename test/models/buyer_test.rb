# == Schema Information
#
# Table name: buyers
#
#  id                    :integer          not null, primary key
#  full_name             :string
#  ic_number             :string
#  address               :string
#  mobile_contact_number :string
#  home_contact_number   :string
#  office_contact_number :string
#  email                 :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  gender                :integer
#  slug                  :string
#  is_bumi_putera        :boolean          default(FALSE)
#  sources_type_id       :integer
#  race                  :integer
#  age                   :integer
#  region_id             :integer
#  buyer_second_name     :string
#  buyer_third_name      :string
#  second_ic_number      :string
#  third_ic_number       :string
#  nationality_id        :integer
#  postcode              :integer
#  car_park              :string
#  remark                :text
#  buyer_second_address  :string
#  buyer_third_address   :string
#  country               :string
#
# Indexes
#
#  index_buyers_on_nationality_id   (nationality_id)
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
