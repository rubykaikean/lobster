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

require "test_helper"

describe CompanySetting do
  let(:company_setting) { CompanySetting.new }

  it "must be valid" do
    company_setting.must_be :valid?
  end
end
