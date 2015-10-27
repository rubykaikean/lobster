class AddExtraSettingColumnToProductSetting < ActiveRecord::Migration
  def change

  	add_column :product_settings, :hide_price_of_sold_unit, :boolean, default: false

  	add_column :product_settings, :notify_agent_on_booking_unit, :boolean, default: false 

  end
end
