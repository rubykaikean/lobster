class AddBuyerIdToSales < ActiveRecord::Migration
  def change
    add_column :sales, :buyer_id, :integer
    add_index  :sales, :buyer_id
  end
end
