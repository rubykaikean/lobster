class AddUnitPerRowToProductSettings < ActiveRecord::Migration
  def change
    add_column :product_settings, :unit_per_row, :integer, default: 5
  end
end
