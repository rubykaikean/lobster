# == Schema Information
#
# Table name: product_settings
#
#  id                                :integer          not null, primary key
#  product_id                        :integer
#  allow_multiple_booking            :boolean          default(FALSE)
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#  unit_per_row                      :integer          default(5)
#  notify_buyer_on_sale_confirmation :boolean          default(FALSE)
#  notify_admin_on_sale_confirmation :boolean          default(FALSE)
#

class ProductSettingSerializer < ActiveModel::Serializer
  attributes :id, :allow_multiple_booking
end
