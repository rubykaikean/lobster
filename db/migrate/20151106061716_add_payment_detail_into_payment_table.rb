class AddPaymentDetailIntoPaymentTable < ActiveRecord::Migration
  def change

  	add_column :payments, :cheque_number, :string
		add_column :payments, :transaction_number, :string


  end
end
