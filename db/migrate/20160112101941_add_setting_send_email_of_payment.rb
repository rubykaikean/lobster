class AddSettingSendEmailOfPayment < ActiveRecord::Migration
  def change

  	add_column :product_settings, :notify_admin_on_payment_upload, :boolean, default: false

  end
end
