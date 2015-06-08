# == Schema Information
#
# Table name: product_types
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  product_id  :integer
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
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
