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

  ACTIVE = 1
  SUSPENDED = 2
  CLOSED = 3

  def create_bulk_phases(phase)
  	phase.to_i.times do |num|
  		phases.create!(name: "Phase #{num}")
  	end
  end

  def status
    case status_id
    when ACTIVE
      "Active"
    when SUSPENDED
      "Suspended"
    when CLOSED
      "Closed"
    end
  end

end
