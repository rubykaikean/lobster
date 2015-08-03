# == Schema Information
#
# Table name: enquiries
#
#  id         :integer          not null, primary key
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe Enquiry do
  let(:enquiry) { Enquiry.new }

  it "must be valid" do
    enquiry.must_be :valid?
  end
end
