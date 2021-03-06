# == Schema Information
#
# Table name: site_plans
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
#  index_site_plans_on_product_id  (product_id)
#

require "test_helper"

describe SitePlan do
  let(:site_plan) { SitePlan.new }

  it "must be valid" do
    site_plan.must_be :valid?
  end
end
