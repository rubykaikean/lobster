class AddCancellationdateIntoSaleTable < ActiveRecord::Migration
  def change

  	add_column :sales, :cancel_date, :datetime

  	add_column :reservation_customizations, :cancel_date, :boolean, default: false

  	add_column :reservation_customizations, :cancel_date_required, :boolean, default: false

  end
end
