# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer
#

class RegionSerializer < ActiveModel::Serializer
  attributes :id, :name
end
