# == Schema Information
#
# Table name: floor_plans
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
#  index_floor_plans_on_project_id  (project_id)
#

class FloorPlan < ActiveRecord::Base
end
