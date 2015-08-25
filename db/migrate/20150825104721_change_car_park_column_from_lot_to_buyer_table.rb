class ChangeCarParkColumnFromLotToBuyerTable < ActiveRecord::Migration
  def change
  	remove_column :lots, :car_park
  
  	add_column :buyers, :car_park, :string
  end  
end
