# == Schema Information
#
# Table name: companies
#
#  id                  :integer          not null, primary key
#  name                :string
#  registration_number :string(15)
#  address             :text
#  phone_number        :string(15)
#  fax_number          :string(15)
#  type_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  logo_file_name      :string
#  logo_content_type   :string
#  logo_file_size      :integer
#  logo_updated_at     :datetime
#  slug                :string
#  parent_id           :integer
#  status_id           :integer          default(1)
#
# Indexes
#
#  index_companies_on_parent_id  (parent_id)
#  index_companies_on_slug       (slug) UNIQUE
#

class Company < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  validates :name, presence: true, uniqueness: { scope: :parent_id }

  has_many :users, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_one :company_setting, dependent: :destroy
  has_many :agencies, class_name: "Company", foreign_key: "parent_id"
  has_many :products
  has_many :regions
  has_many :sources_types

  has_attached_file :logo, 
          #:styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",
          :default_url => ActionController::Base.helpers.asset_path('your-your_company_logo.jpg'),
          #:processors => [:thumbnail, :paperclip_optimizer],
          :path => "companies/:id/:filename"
  
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  after_create :generate_setting

  DEVELOPER = 1
  AGENCY    = 2

  ACTIVE = 1
  SUSPENDED = 2

  TYPE_OPTIONS = [
    ["Developer", DEVELOPER],
    ["Agency", AGENCY]
  ].freeze

  def type
    case type_id
    when DEVELOPER
      "Developer"
    when AGENCY
      "Agency"
    end
  end

  def status
    case status_id
    when ACTIVE
      "Active"
    when SUSPENDED
      "Suspended"
    end
  end

  def is_active?
    status_id == ACTIVE
  end

  def is_suspended
    status_id == SUSPENDED
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

  private

  def generate_setting
    unless company_setting.present? && parent_id > 0
      create_company_setting
    end
  end

end
