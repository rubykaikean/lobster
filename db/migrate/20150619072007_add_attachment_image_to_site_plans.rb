class AddAttachmentImageToSitePlans < ActiveRecord::Migration
  def self.up
    change_table :site_plans do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :site_plans, :image
  end
end
