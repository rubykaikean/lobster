class AddProductSettingHidePriceBookedUnit < ActiveRecord::Migration
  def change

  	add_column :product_settings, :hide_price_of_reserved_unit, :boolean, default: false

  end
end
