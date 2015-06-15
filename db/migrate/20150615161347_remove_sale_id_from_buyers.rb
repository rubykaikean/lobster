class RemoveSaleIdFromBuyers < ActiveRecord::Migration
  def change
    remove_column :buyers, :sale_id
    remove_column :buyers, :status_id
    # remove_index  :buyers, :sale_id
  end
end
