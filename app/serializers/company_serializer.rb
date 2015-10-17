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
#  extended_url        :string
#
# Indexes
#
#  index_companies_on_parent_id  (parent_id)
#  index_companies_on_slug       (slug) UNIQUE
#

class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :registration_number, :address, :phone_number, :fax_number, :logo
end
