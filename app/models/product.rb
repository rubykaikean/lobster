# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  type_id     :integer
#  description :text
#  status_id   :integer
#  phase_id    :integer
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_products_on_phase_id  (phase_id)
#  index_products_on_slug      (slug) UNIQUE
#

class Product < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, :use => :slugged

	belongs_to :phase
	has_many :lots
	has_many :product_types

	validates :name, presence: true, uniqueness: true

	LANDED = 1
	HIGHRISE = 2

	def product_title
		"#{self.name} - #{product_type}" 
	end

	def product_type
		if self.type_id == LANDED
			"Landed"
		elsif self.type_id == HIGHRISE
			"Highrise"
		end
	end

	def self.auto_create_lot(product)
		product[:lot_no].to_i.times do |p|
			product[:start_number]
			p = p + 1
			# lots.create!(name: "#{product[:prepend_title]}-#{product[:start_number]}", product_id: product[:product_id])
		end
		product.times do |p, index|
			puts index + 1
		end

	end

end
