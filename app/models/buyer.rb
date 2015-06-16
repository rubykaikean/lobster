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
#  age                   :integer
#  region                :string
#  race                  :string
#  sources               :string
#  slug                  :string
#
# Indexes
#
#  index_buyers_on_slug  (slug) UNIQUE
#

class Buyer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  
  has_many :sales

  # validates :full_name, :ic_number


end
