# == Schema Information
#
# Table name: products
#
#  id                                   :integer          not null, primary key
#  name                                 :string
#  type_id                              :integer
#  description                          :text
#  status_id                            :integer
#  phase_id                             :integer
#  slug                                 :string
#  created_at                           :datetime         not null
#  updated_at                           :datetime         not null
#  is_published                         :boolean          default(FALSE)
#  company_id                           :integer
#  e_brochure_url                       :string
#  address                              :string
#  location                             :string
#  display_price                        :integer
#  display_sqft                         :integer
#  currency                             :string
#  completion_date                      :datetime
#  details_description                  :text
#  nearby_location_description          :text
#  background_image_file_name           :string
#  background_image_content_type        :string
#  background_image_file_size           :integer
#  background_image_updated_at          :datetime
#  second_background_image_file_name    :string
#  second_background_image_content_type :string
#  second_background_image_file_size    :integer
#  second_background_image_updated_at   :datetime
#  map_image_file_name                  :string
#  map_image_content_type               :string
#  map_image_file_size                  :integer
#  map_image_updated_at                 :datetime
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

	belongs_to :phase
	belongs_to :company
	has_many :lots, dependent: :destroy
	has_many :product_types
	has_one  :email_setting
	has_one  :product_setting
	has_one  :reservation_customization
  has_many :sales
  has_many :floor_plans
  has_many :site_plans
  has_many :regions
  has_many :sources_types
  has_many :enquiries
  has_many :product_photos
  has_and_belongs_to_many :users
  

  validates :company_id, presence: true, allow_nil: true
	# validates :name, presence: true, uniqueness: { scope: :phase_id }
	after_create :generate_setting
  after_find :generate_setting

  has_attached_file :background_image,
                  :styles => {:large => "1920x1080>", :medium => "500x500>", :thumb => "100x100>" },
                  :path => "images/background_image/:id/:style/:filename"  
  
  has_attached_file :second_background_image,
                  :styles => {:large => "1920x1080>", :medium => "500x500>", :thumb => "100x100>" },
                  :path => "images/background_image/:id/:style/:filename"  


  has_attached_file :map_image,
                    :styles => {:large => "500x500>", :medium => "300x300>", :thumb => "100x100>" },
                    :path => "images/map_image/:id/:style/:filename"  

  validates_attachment :background_image, :second_background_image, :map_image, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg"] }
  validates_attachment_size :background_image, :second_background_image, :map_image, :less_than => 5.megabytes



  scope :published, -> { where(is_published: true) }

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

  def try_to_destroy
    if lots.any? || sales.any?
      false
    else
      true
    end
  end

  private

  def generate_setting
    unless product_setting.present?
      create_product_setting
    end
    unless email_setting.present?
      create_email_setting
    end
    unless reservation_customization.present?
    	create_reservation_customization
    end
  end

end
