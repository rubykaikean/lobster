# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string
#  type_id        :integer
#  description    :text
#  status_id      :integer
#  phase_id       :integer
#  slug           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  is_published   :boolean          default(FALSE)
#  company_id     :integer
#  e_brochure_url :string
#
# Indexes
#
#  index_products_on_company_id  (company_id)
#  index_products_on_phase_id    (phase_id)
#  index_products_on_slug        (slug) UNIQUE
#

class Product < ActiveRecord::Base
	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged
  # friendly_id :name, :use => :slugged

	belongs_to :phase
	belongs_to :company
	has_many :lots, dependent: :destroy
	has_many :product_types, dependent: :destroy
	has_one  :email_setting, dependent: :destroy
	has_one  :product_setting, dependent: :destroy
  has_many :sales
  has_many :floor_plans
  has_many :site_plans
  has_many :regions
  has_many :sources_types

  validates :company_id, presence: true, allow_nil: true
	# validates :name, presence: true, uniqueness: { scope: :phase_id }
	after_create :generate_setting
  after_find :generate_setting

	LANDED = 1
	HIGHRISE = 2
	
	AVAILABLE = 1
  PENDING = 2

	def title
		"#{name} - #{type}" 
	end

	def status
		if self.status_id == AVAILABLE
			"Available"
		elsif self.type_id == PENDING
			"Pending"
		end
	end

	def type
		if self.type_id == LANDED
			"Landed"
		elsif self.type_id == HIGHRISE
			"Highrise"
		end
	end

	# def self.bumi_putera_price(race_id, lot_id)
	# end

	def auto_create_lot(lot)
		title = lot[:prepend_title]
		target_type_id = lot[:type_id].to_i
		starting_number = lot[:start_number].to_i
    quantity = lot[:lot_no].to_i
    target_row_key = lot[:row_key].to_i
    ending_number = starting_number + quantity
		while starting_number < ending_number do
			lots.create(name: "#{title}-#{starting_number}", product_type_id: target_type_id, row_key: target_row_key)
			starting_number += 1
		end
	end

	def slug_candidates
  	[ 
  		slug_name
  	 ]
  end

	def slug_name
		"#{name} in #{phase.slug_name}"
	end

	def should_generate_new_friendly_id?
    name_changed?
  end

  private

  def generate_setting
    unless product_setting.present?
      create_product_setting
    end
    unless email_setting.present?
      create_email_setting
    end
  end

end
