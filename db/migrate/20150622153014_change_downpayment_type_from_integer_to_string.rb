class ChangeDownpaymentTypeFromIntegerToString < ActiveRecord::Migration
  def change
    remove_column :sales, :downpayment_type
    add_column :sales, :downpayment_type, :string
  end
end
