# == Schema Information
#
# Table name: product_settings
#
#  id                        :integer          not null, primary key
#  product_id                :integer
#  allow_multiple_booking    :boolean          default(FALSE)
#  use_product_type_info     :boolean          default(TRUE)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  unit_per_row              :integer          default(5)
#  bumi_putera_discount_rate :integer
#

class ProductSettingSerializer < ActiveModel::Serializer
  attributes :id, :allow_multiple_booking
end
