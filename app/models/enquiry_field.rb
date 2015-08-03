# == Schema Information
#
# Table name: enquiry_fields
#
#  id         :integer          not null, primary key
#  enquiry_id :integer
#  name       :string
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EnquiryField < ActiveRecord::Base
  belongs_to :enquiry
end
