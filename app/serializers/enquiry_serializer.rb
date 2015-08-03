# == Schema Information
#
# Table name: enquiries
#
#  id         :integer          not null, primary key
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EnquirySerializer < ActiveModel::Serializer
  attributes :id, :product_id
end
