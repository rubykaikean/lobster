# == Schema Information
#
# Table name: product_settings
#
#  id                     :integer          not null, primary key
#  allow_multiple_booking :boolean          default(FALSE)
#  use_product_type_info  :boolean          default(TRUE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class ProductSetting < ActiveRecord::Base
end
