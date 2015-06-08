# == Schema Information
#
# Table name: lots
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
#  index_lots_on_product_id  (product_id)
#  index_lots_on_slug        (slug) UNIQUE
#

require "test_helper"

describe Lot do
  let(:lot) { Lot.new }

  it "must be valid" do
    lot.must_be :valid?
  end
end
