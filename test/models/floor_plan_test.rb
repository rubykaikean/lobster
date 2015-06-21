# == Schema Information
#
# Table name: floor_plans
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  product_id         :integer
#
# Indexes
#
#  index_floor_plans_on_product_id  (product_id)
#

require "test_helper"

describe FloorPlan do
  let(:floor_plan) { FloorPlan.new }

  it "must be valid" do
    floor_plan.must_be :valid?
  end
end
