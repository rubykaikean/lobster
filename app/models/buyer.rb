# == Schema Information
#
# Table name: buyers
#
#  id                    :integer          not null, primary key
#  full_name             :string
#  ic_number             :string
#  address               :text
#  mobile_contact_number :string
#  home_contact_number   :string
#  office_contact_number :string
#  email                 :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  gender                :integer
#  slug                  :string
#  is_bumi_putera        :boolean          default(FALSE)
#  sources_type_id       :integer
#  race                  :integer
#  age                   :integer
#  region_id             :integer
#  buyer_second_name     :string
#  buyer_third_name      :string
#  second_ic_number      :string
#  third_ic_number       :string
#  nationality_id        :integer
#  postcode              :integer
#  car_park              :string
#
# Indexes
#
#  index_buyers_on_nationality_id   (nationality_id)
#  index_buyers_on_region_id        (region_id)
#  index_buyers_on_slug             (slug) UNIQUE
#  index_buyers_on_sources_type_id  (sources_type_id)
#

class Buyer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  
  has_many :sales
  belongs_to :sources_type
  belongs_to :region

  # validates :full_name, :ic_number, :address, :mobile_contact_number, :gender, :sources_type_id, :race, :age, :region_id, presence: true

  CHINESE = 1
  BUMIPUTERA = 2
  INDIAN = 3
  OTHER = 4

  def should_generate_new_friendly_id?
    full_name_changed?
  end

  def is_bumiputera?
    race == BUMIPUTERA
  end


end
