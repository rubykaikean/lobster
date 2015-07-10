class RemoveUnusedColumnsInProductSettings < ActiveRecord::Migration
  def change
    remove_column :product_settings, :use_product_type_info
    remove_column :product_settings, :bumi_putera_discount_rate
  end
end
