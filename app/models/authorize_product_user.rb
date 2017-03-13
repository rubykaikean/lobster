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

class AuthorizeProductUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :product
end
