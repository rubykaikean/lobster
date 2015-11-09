class MoveColumnFromPaymentToSale < ActiveRecord::Migration
  def change

  	remove_column :payments, :cheque_number, :string
		remove_column :payments, :transaction_number, :string
  	add_column :sales, :cheque_number, :string
		add_column :sales, :transaction_number, :string
  end
end
