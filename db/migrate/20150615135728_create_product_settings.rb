class CreateProductSettings < ActiveRecord::Migration
  def change
    create_table :product_settings do |t|
      t.integer :product_id
      t.boolean :allow_multiple_booking, default: false
      t.boolean :use_product_type_info, default: true

      t.timestamps null: false
    end
  end
end
