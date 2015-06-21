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
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#
# Indexes
#
#  index_site_plans_on_project_id  (project_id)
#

class SitePlanSerializer < ActiveModel::Serializer
  attributes :id, :project_id
end
