# == Schema Information
#
# Table name: payments
#
#  id                 :integer          not null, primary key
#  sale_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Payment < ActiveRecord::Base
  belongs_to :sale

  has_attached_file :image,
                    :styles => {:large => "500x500>", :medium => "300x300>", :thumb => "100x100>" },
                    #:default_url => ActionController::Base.helpers.asset_path('wechat/missing.jpg'),
                    #:processors => [:thumbnail, :paperclip_optimizer],
                    :path => "payments/:id/:filename"
                    #:url  => "/system/:attachment/:id/:style/:filename"

  # validates :image_file_name, presence: true
  validates_attachment :image, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg"] }
  validates_attachment_size :image, :less_than => 5.megabytes
end
