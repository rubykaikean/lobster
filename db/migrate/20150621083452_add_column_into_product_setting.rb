class AddColumnIntoProductSetting < ActiveRecord::Migration
  def change
  	add_column :product_settings, :bumi_putera_discount_rate, :integer

  	add_column :lots, :is_bumi_putera_unit, :boolean, default: false

  	# remove_column :buyers, :is_bumi_putera
  end
end
