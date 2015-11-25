class AddColumnIntoProductTypeTable < ActiveRecord::Migration
  def change
  	add_column :product_settings, :hide_detail_blocked_unit, :boolean, default: false
  end
end
