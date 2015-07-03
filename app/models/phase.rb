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
  has_many   :products

  # validates :name, presence: true

  AVAILABLE = 1
  PENDING = 2

  def status
    case status_id
    when AVAILABLE
      "Available"
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

  def try_to_destroy
    if products.any?
      return false, "The phase cannot be delete because it's has at least one product attached."
    else
      return true, "Save to destroy"
    end
  end

end
