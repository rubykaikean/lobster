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
#  land_area_square_meter  :integer          default(0)
#  land_area_square_feet   :integer          default(0)
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

  def create_buyer(lot, user_id)
    
    @user_id = user_id
    buyer = Buyer.new
    buyer.full_name = lot[:name]
    buyer.ic_number = lot[:ic_number]
    buyer.address = lot[:address]
    buyer.email = lot[:email]
    buyer.gender = lot[:gender]
    buyer.age = lot[:age]
    buyer.region = lot[:region]
    buyer.race = lot[:race]
    buyer.sources = lot[:sources]
    buyer.mobile_contact_number = lot[:mobile_contact_number]
    buyer.home_contact_number = lot[:home_contact_number]
    buyer.office_contact_number = lot[:office_contact_number]
    @booking_fee = lot[:booking_fee]

    buyer.save!
    @buyer_id = buyer.id
    create_sale
  end

  def create_sale
    sale = Sale.new
    sale.project_id = product.phase.project_id
    sale.product_id = product_id
    sale.lot_unit_id = self.id
    sale.phase_id = product.phase_id
    sale.user_id = @user_id
    sale.booking_fee = @booking_fee
    # sale.status_id = 
    sale.buyer_id = @buyer_id
    # sale.downpayment
    # sale.downpayment_percentage
    # sale.downpayment_type
    # sale.bank_loan
    # sale.spa
    sale.save!
    change_lot_status
  end

  def change_lot_status
    
  end

  

end
