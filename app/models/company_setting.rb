# == Schema Information
#
# Table name: company_settings
#
#  id                     :integer          not null, primary key
#  company_id             :integer
#  allow_multiple_booking :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_company_settings_on_company_id  (company_id)
#

class CompanySetting < ActiveRecord::Base
	# extend FriendlyId
	# friendly_id :company_id, :use => :slugged
	belongs_to :company

end
