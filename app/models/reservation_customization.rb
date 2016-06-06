# == Schema Information
#
# Table name: reservation_customizations
#
#  id                              :integer          not null, primary key
#  product_id                      :integer
#  full_name                       :boolean          default(FALSE)
#  ic_number                       :boolean          default(FALSE)
#  address                         :boolean          default(FALSE)
#  mobile_contact_number           :boolean          default(FALSE)
#  home_contact_number             :boolean          default(FALSE)
#  office_contact_number           :boolean          default(FALSE)
#  email                           :boolean          default(FALSE)
#  gender                          :boolean          default(FALSE)
#  is_bumi_putera                  :boolean          default(FALSE)
#  race                            :boolean          default(FALSE)
#  age                             :boolean          default(FALSE)
#  buyer_second_name               :boolean          default(FALSE)
#  buyer_third_name                :boolean          default(FALSE)
#  second_ic_number                :boolean          default(FALSE)
#  third_ic_number                 :boolean          default(FALSE)
#  postcode                        :boolean          default(FALSE)
#  downpayment                     :boolean          default(FALSE)
#  downpayment_percentage          :boolean          default(FALSE)
#  spa                             :boolean          default(FALSE)
#  booking_fee                     :boolean          default(FALSE)
#  reject_reason                   :boolean          default(FALSE)
#  downpayment_type                :boolean          default(FALSE)
#  confirm_date                    :boolean          default(FALSE)
#  sale_date                       :boolean          default(FALSE)
#  selling_price                   :boolean          default(FALSE)
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  full_name_required              :boolean          default(FALSE)
#  ic_number_required              :boolean          default(FALSE)
#  address_required                :boolean          default(FALSE)
#  mobile_contact_number_required  :boolean          default(FALSE)
#  home_contact_number_required    :boolean          default(FALSE)
#  office_contact_number_required  :boolean          default(FALSE)
#  email_required                  :boolean          default(FALSE)
#  gender_required                 :boolean          default(FALSE)
#  is_bumi_putera_required         :boolean          default(FALSE)
#  race_required                   :boolean          default(FALSE)
#  age_required                    :boolean          default(FALSE)
#  buyer_second_name_required      :boolean          default(FALSE)
#  buyer_third_name_required       :boolean          default(FALSE)
#  second_ic_number_required       :boolean          default(FALSE)
#  third_ic_number_required        :boolean          default(FALSE)
#  postcode_required               :boolean          default(FALSE)
#  downpayment_required            :boolean          default(FALSE)
#  downpayment_percentage_required :boolean          default(FALSE)
#  spa_required                    :boolean          default(FALSE)
#  booking_fee_required            :boolean          default(FALSE)
#  reject_reason_required          :boolean          default(FALSE)
#  downpayment_type_required       :boolean          default(FALSE)
#  confirm_date_required           :boolean          default(FALSE)
#  sale_date_required              :boolean          default(FALSE)
#  selling_price_required          :boolean          default(FALSE)
#  region_id                       :boolean          default(FALSE)
#  region_id_required              :boolean          default(FALSE)
#  nationality_id                  :boolean          default(FALSE)
#  nationality_id_required         :boolean          default(FALSE)
#  sources_type_id                 :boolean          default(FALSE)
#  sources_type_id_required        :boolean          default(FALSE)
#  sale_person                     :boolean          default(FALSE)
#  sale_person_required            :boolean          default(FALSE)
#  car_park                        :boolean          default(FALSE)
#  car_park_required               :boolean          default(FALSE)
#  remark                          :boolean          default(FALSE)
#  remark_required                 :boolean          default(FALSE)
#  payment_type_id                 :boolean          default(FALSE)
#  payment_type_id_required        :boolean          default(FALSE)
#  payment_image                   :boolean          default(FALSE)
#  cancel_date                     :boolean          default(FALSE)
#  cancel_date_required            :boolean          default(FALSE)
#  cheque_number                   :boolean          default(FALSE)
#  transaction_number              :boolean          default(FALSE)
#  cheque_number_required          :boolean          default(FALSE)
#  transaction_number_required     :boolean          default(FALSE)
#  country                         :boolean          default(FALSE)
#  country_required                :boolean          default(FALSE)
#
# Indexes
#
#  index_reservation_customizations_on_product_id  (product_id)
#

#
# Indexes
#
#  index_reservation_customizations_on_product_id  (product_id)
#

class ReservationCustomization < ActiveRecord::Base

	belongs_to :product

end
