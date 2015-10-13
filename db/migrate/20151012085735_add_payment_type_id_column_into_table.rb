class AddPaymentTypeIdColumnIntoTable < ActiveRecord::Migration
  def change
  	remove_column :reservation_customizations, :payment_type
  	add_column :reservation_customizations, :payment_type_id, :boolean, default: false
  	remove_column :reservation_customizations, :payment_type_required
  	add_column :reservation_customizations, :payment_type_id_required, :boolean, default: false

  end
end
