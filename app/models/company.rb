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
#
# Indexes
#
#  index_companies_on_parent_id  (parent_id)
#  index_companies_on_slug       (slug) UNIQUE
#

class Company < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  validates :name, presence: true, uniqueness: true
  # validates :display_name, uniqueness: { scope: :company_id }

  has_many :users
  has_many :projects
  has_one :company_setting

  has_attached_file :logo, 
          #:styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",
          :default_url => ActionController::Base.helpers.asset_path('your-your_company_logo.jpg'),
          #:processors => [:thumbnail, :paperclip_optimizer],
          :path => "companies/:id/:filename"
  
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  DEVELOPER = 1
  AGENCY    = 2

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

end
