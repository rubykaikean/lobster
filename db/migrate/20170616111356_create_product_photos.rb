class CreateProductPhotos < ActiveRecord::Migration
  def change
    create_table :product_photos do |t|
    	t.integer :product_id
    	t.integer :is_primary
    	t.attachment :photo

      t.timestamps null: false
    end

    add_index :product_photos, :product_id
  end
end
