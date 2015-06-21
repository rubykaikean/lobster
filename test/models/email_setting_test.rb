# == Schema Information
#
# Table name: email_settings
#
#  id         :integer          not null, primary key
#  product_id :integer
#  subject    :string
#  from       :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_email_settings_on_product_id  (product_id)
#

require "test_helper"

describe EmailSetting do
  let(:email_setting) { EmailSetting.new }

  it "must be valid" do
    email_setting.must_be :valid?
  end
end
