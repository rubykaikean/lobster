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
  belongs_to :product
  has_attached_file :image,
                    # :styles => {:large => "500x500>", :medium => "300x300>", :thumb => "100x100>" },
                    #:default_url => ActionController::Base.helpers.asset_path('wechat/missing.jpg'),
                    #:processors => [:thumbnail, :paperclip_optimizer],
                    :path => "floor_plans/:id/:filename"
                    #:url  => "/system/:attachment/:id/:style/:filename"
  
  validates_attachment :photo, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg"] }
  validates_attachment_size :photo, :less_than => 5.megabytes
end
