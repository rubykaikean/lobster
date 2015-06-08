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
end
