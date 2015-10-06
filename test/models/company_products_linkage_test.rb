# == Schema Information
#
# Table name: company_products_linkages
#
#  id         :integer          not null, primary key
#  company_id :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_company_products_linkages_on_company_id  (company_id)
#  index_company_products_linkages_on_product_id  (product_id)
#

require "test_helper"

describe CompanyProductsLinkage do
  let(:company_products_linkage) { CompanyProductsLinkage.new }

  it "must be valid" do
    company_products_linkage.must_be :valid?
  end
end
