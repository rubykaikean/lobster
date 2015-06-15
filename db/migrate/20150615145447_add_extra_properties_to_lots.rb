class AddExtraPropertiesToLots < ActiveRecord::Migration
  def change
    add_column :lots, :land_area_square_meter, :integer, default: 0
    add_column :lots, :land_area_square_feet, :integer, default: 0
    add_column :lots, :extra_land_square_meter, :integer, default: 0
    add_column :lots, :extra_land_square_feet, :integer, default: 0
    add_column :lots, :premium, :integer
    add_column :lots, :extra_land_price, :integer, default: 0
    add_column :lots, :selling_price, :integer, default: 0
  end
end
