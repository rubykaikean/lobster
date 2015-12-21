class RemoveAddChqAndTransactionColumn < ActiveRecord::Migration
  def change

  	remove_column :sales, :chq_number
  	remove_column :sales, :credit_card_number

  	add_column :reservation_customizations, :cheque_number, :boolean, default: false
		add_column :reservation_customizations, :transaction_number, :boolean , default: false
  	add_column :reservation_customizations, :cheque_number_required, :boolean, default: false
  	add_column :reservation_customizations, :transaction_number_required, :boolean, default: false

  end
end
