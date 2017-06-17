# == Schema Information
#
# Table name: product_photos
#
#  id                 :integer          not null, primary key
#  product_id         :integer
#  is_primary         :integer
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_product_photos_on_product_id  (product_id)
#

class ProductPhoto < ActiveRecord::Base

	belongs_to :product
	
	has_attached_file :photo,
                    :styles => {:large => "500x500>", :medium => "300x300>", :medium_thumb => "200x200>", :thumb => "100x100>" },
                    #:default_url => ActionController::Base.helpers.asset_path('wechat/missing.jpg'),
                    #:processors => [:thumbnail, :paperclip_optimizer],
                    :path => "images/product_photos/:id/:style/:filename"
                    #:url  => "/system/:attachment/:id/:style/:filename"
  
  validates :photo_file_name, presence: true
  validates_attachment :photo, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg"] }
  validates_attachment_size :photo, :less_than => 5.megabytes

end
