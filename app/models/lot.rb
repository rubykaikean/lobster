# == Schema Information
#
# Table name: lots
#
#  id                      :integer          not null, primary key
#  name                    :string
#  description             :text
#  product_id              :integer
#  slug                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  product_type_id         :integer
#  status_id               :integer          default(1)
#  land_area_square_meter  :integer
#  land_area_square_feet   :integer
#  extra_land_square_meter :integer          default(0)
#  extra_land_square_feet  :integer          default(0)
#  premium                 :integer
#  extra_land_price        :integer          default(0)
#  selling_price           :integer          default(0)
#
# Indexes
#
#  index_lots_on_product_id       (product_id)
#  index_lots_on_product_type_id  (product_type_id)
#  index_lots_on_slug             (slug) UNIQUE
#

class Lot < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

	belongs_to :product
  belongs_to :product_type

	validates :name, presence: true, uniqueness: { scope: :product_id }

  AVAILABLE = 1
  RESERVED  = 2
  SOLD      = 3

  def is_available?
    status_id == AVAILABLE
  end

  def is_reserved?
    status_id == RESERVED
  end

  def is_sold?
    status_id == SOLD
  end

  def status
    case status_id
    when AVAILABLE
      "Available"
    when RESERVED
      "Reserved"
    when SOLD
      "Sold"
    end
  end

  def slug_candidates
    [ 
      slug_name
     ]
  end
  
  def slug_name
    "#{name} of #{product.name}"
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

end
