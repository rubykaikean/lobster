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
#  bumiputera_discount               :integer          default(5)
#  attach_payment_image              :boolean          default(FALSE)
#  hide_detail_blocked_unit          :boolean          default(FALSE)
#  hide_price_of_sold_unit           :boolean          default(FALSE)
#  notify_agent_on_booking_unit      :boolean          default(FALSE)
#  notify_admin_on_payment_upload    :boolean          default(FALSE)
#  hide_price_of_reserved_unit       :boolean          default(FALSE)
#

class ProductSettingSerializer < ActiveModel::Serializer
  attributes :id, :allow_multiple_booking
end
