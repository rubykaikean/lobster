# == Schema Information
#
# Table name: products
#
#  id                                   :integer          not null, primary key
#  name                                 :string
#  type_id                              :integer
#  description                          :text
#  status_id                            :integer
#  phase_id                             :integer
#  slug                                 :string
#  created_at                           :datetime         not null
#  updated_at                           :datetime         not null
#  is_published                         :boolean          default(FALSE)
#  company_id                           :integer
#  e_brochure_url                       :string
#  address                              :string
#  location                             :string
#  display_price                        :integer
#  display_sqft                         :integer
#  currency                             :string
#  completion_date                      :datetime
#  details_description                  :text
#  nearby_location_description          :text
#  background_image_file_name           :string
#  background_image_content_type        :string
#  background_image_file_size           :integer
#  background_image_updated_at          :datetime
#  second_background_image_file_name    :string
#  second_background_image_content_type :string
#  second_background_image_file_size    :integer
#  second_background_image_updated_at   :datetime
#  map_image_file_name                  :string
#  map_image_content_type               :string
#  map_image_file_size                  :integer
#  map_image_updated_at                 :datetime
#
# Indexes
#
#  index_products_on_company_id  (company_id)
#  index_products_on_phase_id    (phase_id)
#  index_products_on_slug        (slug) UNIQUE
#

require "test_helper"

describe Product do
  let(:product) { Product.new }

  it "must be valid" do
    product.must_be :valid?
  end
end
