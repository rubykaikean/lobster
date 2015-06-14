# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  name         :string
#  description  :text
#  status_id    :integer
#  company_id   :integer
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_published :boolean          default(FALSE)
#
# Indexes
#
#  index_projects_on_company_id  (company_id)
#  index_projects_on_slug        (slug) UNIQUE
#

require "test_helper"

describe Project do
  let(:project) { Project.new }

  it "must be valid" do
    project.must_be :valid?
  end
end
