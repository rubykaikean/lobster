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
#  username               :string
#
# Indexes
#
#  index_users_on_company_id            (company_id)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#

require "test_helper"

def valid_params
  {
    display_name: "Jaz",
    email: "jaz@hotmail.com",
    type_id: 1,
    company_id: 1,
    password: "12345678",
    password_confirmation: "12345678"

  }
end

describe User do
  let(:user) { User.new(valid_params) }

  it "must be valid" do
    user.must_be :valid?
  end
end
