class RemovePurchaserInformationFromSales < ActiveRecord::Migration
  def change
    remove_column :sales, :purchaser_name
    remove_column :sales, :purchaser_address
    remove_column :sales, :purchaser_ic_number
    remove_column :sales, :purchaser_contact_number
  end
end
