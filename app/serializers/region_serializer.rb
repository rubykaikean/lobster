# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#

class RegionSerializer < ActiveModel::Serializer
  attributes :id, :name
end
