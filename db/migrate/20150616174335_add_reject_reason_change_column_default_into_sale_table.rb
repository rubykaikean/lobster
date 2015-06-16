class AddRejectReasonChangeColumnDefaultIntoSaleTable < ActiveRecord::Migration
  def change

  	add_column :sales, :reject_reason, :string

  	change_column :sales, :status_id, :integer, default: 1

  end
end
