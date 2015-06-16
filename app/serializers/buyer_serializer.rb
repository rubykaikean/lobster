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
#

class BuyerSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :ic_number, :address, :mobile_contact_number, :home_contact_number, :office_contact_number, :email, :status_id
end
