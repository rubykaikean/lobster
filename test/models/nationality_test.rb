# == Schema Information
#
# Table name: nationalities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe Nationality do
  let(:nationality) { Nationality.new }

  it "must be valid" do
    nationality.must_be :valid?
  end
end
