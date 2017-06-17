# == Schema Information
#
# Table name: product_photos
#
#  id                 :integer          not null, primary key
#  product_id         :integer
#  is_primary         :integer
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_product_photos_on_product_id  (product_id)
#

require "test_helper"

describe ProductPhoto do
  let(:product_photo) { ProductPhoto.new }

  it "must be valid" do
    product_photo.must_be :valid?
  end
end
