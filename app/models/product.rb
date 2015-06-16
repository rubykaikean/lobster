# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  name         :string
#  type_id      :integer
#  description  :text
#  status_id    :integer
#  phase_id     :integer
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_published :boolean          default(FALSE)
#  company_id   :integer
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
	has_one  :product_setting, dependent: :destroy
  has_many :sales

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

	def auto_create_lot(lot)
		title = lot[:prepend_title]
		type_id = lot[:type_id].to_i
		num = lot[:start_number].to_i
		lot[:lot_no].to_i.times do |p|
			
			lots.create!(name: "#{title}-#{num}", product_type_id: type_id)
			num += 1
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
  end

end
