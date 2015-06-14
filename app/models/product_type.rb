# == Schema Information
#
# Table name: product_types
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
#  index_product_types_on_product_id  (product_id)
#  index_product_types_on_slug        (slug) UNIQUE
#

class ProductType < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  
	belongs_to :product

	validates :name, presence: true, uniqueness: { scope: :product_id }

  def slug_candidates
    [ 
      slug_name
     ]
  end

  def slug_name
    "#{name} in #{product.slug_name}"
  end

end
