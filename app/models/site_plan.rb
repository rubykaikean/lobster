# == Schema Information
#
# Table name: site_plans
#
#  id                 :integer          not null, primary key
#  project_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#
# Indexes
#
#  index_site_plans_on_project_id  (project_id)
#

class SitePlan < ActiveRecord::Base

	has_attached_file :image

end
