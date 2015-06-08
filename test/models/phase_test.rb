# == Schema Information
#
# Table name: phases
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  status_id   :integer
#  project_id  :integer
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_phases_on_project_id  (project_id)
#  index_phases_on_slug        (slug) UNIQUE
#

require "test_helper"

describe Phase do
  let(:phase) { Phase.new }

  it "must be valid" do
    phase.must_be :valid?
  end
end
