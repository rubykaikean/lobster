class AddAttachmentImageToFloorPlans < ActiveRecord::Migration
  def self.up
    change_table :floor_plans do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :floor_plans, :image
  end
end
