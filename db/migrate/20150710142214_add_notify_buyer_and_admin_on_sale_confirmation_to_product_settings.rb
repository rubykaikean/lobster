class AddNotifyBuyerAndAdminOnSaleConfirmationToProductSettings < ActiveRecord::Migration
  def change
    add_column :product_settings, :notify_buyer_on_sale_confirmation, :boolean, default: false
    add_column :product_settings, :notify_admin_on_sale_confirmation, :boolean, default: false
  end
end
