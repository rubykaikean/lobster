class AddPurchaserInfoToSales < ActiveRecord::Migration
  def change
    add_column :sales, :purchaser_name, :string
    add_column :sales, :purchaser_address, :text
    add_column :sales, :purchaser_ic_number, :string, limit: 15
    add_column :sales, :purchaser_contact_number, :string, limit: 15
  end
end
