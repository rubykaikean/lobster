# == Schema Information
#
# Table name: product_types
#
#  id                      :integer          not null, primary key
#  name                    :string
#  description             :text
#  product_id              :integer
#  slug                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  land_area_square_meter  :integer          default(0)
#  land_area_square_feet   :integer          default(0)
#  extra_land_square_meter :integer          default(0)
#  extra_land_square_feet  :integer          default(0)
#  extra_land_price        :integer          default(0)
#
# Indexes
#
#  index_product_types_on_product_id  (product_id)
#  index_product_types_on_slug        (slug) UNIQUE
#

require "test_helper"

describe ProductType do
  let(:product_type) { ProductType.new }

  it "must be valid" do
    product_type.must_be :valid?
  end
end
