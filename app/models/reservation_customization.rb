# == Schema Information
#
# Table name: reservation_customizations
#
#  id                     :integer          not null, primary key
#  product_id             :integer
#  full_name              :boolean          default(FALSE)
#  ic_number              :boolean          default(FALSE)
#  address                :boolean          default(FALSE)
#  mobile_contact_number  :boolean          default(FALSE)
#  home_contact_number    :boolean          default(FALSE)
#  office_contact_number  :boolean          default(FALSE)
#  email                  :boolean          default(FALSE)
#  gender                 :boolean          default(FALSE)
#  is_bumi_putera         :boolean          default(FALSE)
#  race                   :boolean          default(FALSE)
#  age                    :boolean          default(FALSE)
#  buyer_second_name      :boolean          default(FALSE)
#  buyer_third_name       :boolean          default(FALSE)
#  second_ic_number       :boolean          default(FALSE)
#  third_ic_number        :boolean          default(FALSE)
#  postcode               :boolean          default(FALSE)
#  downpayment            :boolean          default(FALSE)
#  downpayment_percentage :boolean          default(FALSE)
#  spa                    :boolean          default(FALSE)
#  booking_fee            :boolean          default(FALSE)
#  reject_reason          :boolean          default(FALSE)
#  downpayment_type       :boolean          default(FALSE)
#  confirm_date           :boolean          default(FALSE)
#  sale_date              :boolean          default(FALSE)
#  selling_price          :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_reservation_customizations_on_product_id  (product_id)
#

class ReservationCustomization < ActiveRecord::Base

	belongs_to :product

end
