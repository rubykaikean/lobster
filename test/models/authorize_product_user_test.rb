# == Schema Information
#
# Table name: authorize_product_users
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_authorize_product_users_on_product_id  (product_id)
#  index_authorize_product_users_on_user_id     (user_id)
#

require "test_helper"

describe AuthorizeProductUser do
  let(:authorize_product_user) { AuthorizeProductUser.new }

  it "must be valid" do
    authorize_product_user.must_be :valid?
  end
end
