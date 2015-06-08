# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  status_id   :integer
#  company_id  :integer
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_projects_on_company_id  (company_id)
#  index_projects_on_slug        (slug) UNIQUE
#

class Project < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, :use => :slugged

  belongs_to :company
  has_many   :phases

  validates :name, presence: true, uniqueness: true

  def self.project_create_phase(phase)
  	phase.times do |num|
  		phases.create!(name: "Phase #{num}")
  	end
  end

end
