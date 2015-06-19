# == Schema Information
#
# Table name: sources_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe SourcesType do
  let(:sources_type) { SourcesType.new }

  it "must be valid" do
    sources_type.must_be :valid?
  end
end
