class AddImageIntoBlogTable < ActiveRecord::Migration
  def self.up
    change_table :blogs do |t|
      t.attachment :blog_background_image

    end
  end

  def self.down
    remove_attachment :blogs, :blog_background_image
  end
end
