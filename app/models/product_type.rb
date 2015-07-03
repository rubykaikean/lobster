# == Schema Information
#
# Table name: product_types
#
#  id                      :integer          not null, primary key
#  name                    :string
#  description             :text
#  product_id              :integer
#  slug                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  land_area_square_meter  :integer          default(0)
#  land_area_square_feet   :integer          default(0)
#  extra_land_square_meter :integer          default(0)
#  extra_land_square_feet  :integer          default(0)
#  extra_land_price        :integer          default(0)
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
  has_many :lots

	validates :name, presence: true, uniqueness: { scope: :product_id }

  def slug_candidates
    [ 
      slug_name
     ]
  end

  def slug_name
    "#{name} in #{product.slug_name}"
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

  def try_to_destroy
    if lots.any?
      return false, "The product type cannot be delete because it's having at least one lot attached."
    else
      return true, "Save to destroy."
    end
  end

end
