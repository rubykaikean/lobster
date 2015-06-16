# == Schema Information
#
# Table name: product_settings
#
#  id                     :integer          not null, primary key
#  product_id             :integer
#  allow_multiple_booking :boolean          default(FALSE)
#  use_product_type_info  :boolean          default(TRUE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require "test_helper"

describe ProductSetting do
  let(:product_setting) { ProductSetting.new }

  it "must be valid" do
    product_setting.must_be :valid?
  end
end
