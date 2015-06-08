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

class PhaseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status_id, :project_id
end
