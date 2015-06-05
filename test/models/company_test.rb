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
#
# Indexes
#
#  index_companies_on_slug  (slug) UNIQUE
#

require "test_helper"

describe Company do
  let(:company) { Company.new }

  it "must be valid" do
    company.must_be :valid?
  end
end
