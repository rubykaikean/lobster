# == Schema Information
#
# Table name: email_settings
#
#  id         :integer          not null, primary key
#  product_id :integer
#  subject    :string
#  from       :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_email_settings_on_product_id  (product_id)
#

class EmailSetting < ActiveRecord::Base

	belongs_to :product
	
end
