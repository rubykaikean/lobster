class CreateProductFeatures < ActiveRecord::Migration
  def change
    create_table :product_features do |t|
      t.integer :product_id
      t.string :name

      t.timestamps null: false
    end

    add_index :product_features, :product_id
  end
end
