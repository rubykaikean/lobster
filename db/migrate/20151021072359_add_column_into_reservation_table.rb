class AddColumnIntoReservationTable < ActiveRecord::Migration
  def change
  	add_column :reservation_customizations, :payment_image, :boolean, default: false
  end
end
