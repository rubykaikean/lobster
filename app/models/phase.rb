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
  friendly_id :slug_candidates, use: :slugged
  # friendly_id :name, :use => :slugged

  belongs_to :project
  has_many   :products, dependent: :destroy

  # validates :name, presence: true

  VARIABLE = 1
  PENDING = 2

  def status
    case status_id
    when VARIABLE
      "Variable"
    when PENDING
      "Pending"
    end
  end

  def slug_candidates
    [ 
      slug_name
     ]
  end
  
  def slug_name
    "#{name} of #{project.name}"
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

end
