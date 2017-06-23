# == Schema Information
#
# Table name: blogs
#
#  id                                 :integer          not null, primary key
#  name                               :string
#  description                        :text
#  product_id                         :integer
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#  blog_background_image_file_name    :string
#  blog_background_image_content_type :string
#  blog_background_image_file_size    :integer
#  blog_background_image_updated_at   :datetime
#
# Indexes
#
#  index_blogs_on_product_id  (product_id)
#

class Blog < ActiveRecord::Base

	belongs_to :product

	has_attached_file :blog_background_image,
                    :styles => {:background => "1170x659", :large => "500x500>", :medium => "370x294", :medium_thumb => "200x200>", :thumb => "100x100>" },
                    #:default_url => ActionController::Base.helpers.asset_path('wechat/missing.jpg'),
                    #:processors => [:thumbnail, :paperclip_optimizer],
                    :path => "images/blogs/:id/:style/:filename"
                    #:url  => "/system/:attachment/:id/:style/:filename"
  
  validates :blog_background_image_file_name, presence: true
  validates_attachment :blog_background_image, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg"] }
  validates_attachment_size :blog_background_image, :less_than => 5.megabytes

end
