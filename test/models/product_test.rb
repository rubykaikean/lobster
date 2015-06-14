# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  name         :string
#  type_id      :integer
#  description  :text
#  status_id    :integer
#  phase_id     :integer
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_published :boolean          default(FALSE)
#
# Indexes
#
#  index_products_on_phase_id  (phase_id)
#  index_products_on_slug      (slug) UNIQUE
#

require "test_helper"

describe Product do
  let(:product) { Product.new }

  it "must be valid" do
    product.must_be :valid?
  end
end
