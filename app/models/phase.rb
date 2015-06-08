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

class Phase < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, :use => :slugged

  belongs_to :project
  has_many   :products

  validates :name, presence: true, uniqueness: true

end
