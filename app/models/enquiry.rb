# == Schema Information
#
# Table name: enquiries
#
#  id         :integer          not null, primary key
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Enquiry < ActiveRecord::Base
  has_many :enquiry_fields
  belongs_to :product
end
