class AddExtraPropertiesToProductTypes < ActiveRecord::Migration
  def change
    add_column :product_types, :land_area_square_meter, :integer, default: 0
    add_column :product_types, :land_area_square_feet, :integer, default: 0
    add_column :product_types, :extra_land_square_meter, :integer, default: 0
    add_column :product_types, :extra_land_square_feet, :integer, default: 0
    add_column :product_types, :extra_land_price, :integer, default: 0
  end
end
