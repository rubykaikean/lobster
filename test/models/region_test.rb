# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#

require "test_helper"

describe Region do
  let(:region) { Region.new }

  it "must be valid" do
    region.must_be :valid?
  end
end
