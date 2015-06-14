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

class Project < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  # friendly_id :name, :use => :slugged

  belongs_to :company
  has_many   :phases, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :company_id }

  ACTIVE = 1
  SUSPENDED = 2
  CLOSED = 3

  def create_bulk_phases(phase)
  	phase.to_i.times do |num|
  		phases.create!(name: "Phase #{num}", status_id: ACTIVE)
  	end
  end

  def is_active?
    status_id == ACTIVE
  end

  def is_suspended?
    status_id == SUSPENDED
  end

  def is_closed?
    status_id == CLOSED
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

  def slug_candidates
    [ 
      slug_name
     ]
  end

  def slug_name
    "#{company.name}-#{name}"
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

end
