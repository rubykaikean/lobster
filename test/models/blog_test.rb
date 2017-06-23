# == Schema Information
#
# Table name: blogs
#
#  id                                 :integer          not null, primary key
#  name                               :string
#  description                        :text
#  product_id                         :integer
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#  blog_background_image_file_name    :string
#  blog_background_image_content_type :string
#  blog_background_image_file_size    :integer
#  blog_background_image_updated_at   :datetime
#
# Indexes
#
#  index_blogs_on_product_id  (product_id)
#

require "test_helper"

describe Blog do
  let(:blog) { Blog.new }

  it "must be valid" do
    blog.must_be :valid?
  end
end
