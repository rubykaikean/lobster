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

class CompanySettingSerializer < ActiveModel::Serializer
  attributes :id, :company_id, :allow_multple_booking
end
