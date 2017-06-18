# == Schema Information
#
# Table name: product_features
#
#  id         :integer          not null, primary key
#  product_id :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_product_features_on_product_id  (product_id)
#

require "test_helper"

describe ProductFeature do
  let(:product_feature) { ProductFeature.new }

  it "must be valid" do
    product_feature.must_be :valid?
  end
end
