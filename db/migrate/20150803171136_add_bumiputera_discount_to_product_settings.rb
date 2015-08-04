class AddBumiputeraDiscountToProductSettings < ActiveRecord::Migration
  def change
    add_column :product_settings, :bumiputera_discount, :integer, default: 5
  end
end
