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

class Lot < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

	belongs_to :product

	# validates :name, presence: true, uniqueness: true

  def slug_candidates
    [ 
      slug_name
     ]
  end
  
  def slug_name
    "#{name} of #{product.name}"
  end

end
