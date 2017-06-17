class AddExtraAttachmentIntoProductTable < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :background_image

      t.attachment :second_background_image

      t.attachment :map_image
    end
  end

  def self.down
    remove_attachment :products, :background_image
  
    remove_attachment :products, :second_background_image

    remove_attachment :products, :map_image
  end
end
