class AddRequireBookingPaymentImageInProductSettings < ActiveRecord::Migration
  def change
    add_column :product_settings, :attach_payment_image, :boolean, default: false
  end
end
