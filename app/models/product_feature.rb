# == Schema Information
#
# Table name: product_features
#
#  id         :integer          not null, primary key
#  product_id :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_product_features_on_product_id  (product_id)
#

class ProductFeature < ActiveRecord::Base


	belongs_to :product

end
