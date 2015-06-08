# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  display_name           :string
#  type_id                :integer
#  company_id             :integer
#  slug                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#
# Indexes
#
#  index_users_on_company_id            (company_id)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#

class User < ActiveRecord::Base
	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged
	# friendly_id :full_name, :use => :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company

  validates :display_name, presence: true, uniqueness: true

  ADMIN = 1
  STAFF = 2

  TYPE_OPTIONS = [
    ["Admin", ADMIN],
    ["Staff", STAFF]
  ].freeze

  def slug_candidates
  	[ 
  		slug_name,
      :display_name
  	 ]
  end

  def slug_name
    if domain_name
      "#{email_name} at #{domain_name}"
    else
      email_name
    end
  end

  def email_name
	  email.split("@").first rescue nil
  end

  def domain_name
  	email.split("@").last.split(".").first rescue nil
  end

  def is_admin?
    type_id == ADMIN
  end

  def is_staff?
    type_id == STAFF
  end

end
