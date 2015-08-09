class AddSpecialColumnToLotTable < ActiveRecord::Migration
  def change

  	add_column :lots, :is_special_unit, :boolean, default: false

  end
end
