# == Schema Information
#
# Table name: enquiry_fields
#
#  id         :integer          not null, primary key
#  enquiry_id :integer
#  name       :string
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe EnquiryField do
  let(:enquiry_field) { EnquiryField.new }

  it "must be valid" do
    enquiry_field.must_be :valid?
  end
end
