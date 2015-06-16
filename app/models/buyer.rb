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

class Buyer < ActiveRecord::Base
  has_many :sales


  def create_buyer_sale(lot)
  		
  end

end
