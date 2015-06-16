class AddColumnIntoSalesTable < ActiveRecord::Migration
  def change

  	add_column :sales, :downpayment, :integer
  	add_column :sales, :downpayment_percentage, :integer
  	add_column :sales, :downpayment_type, :integer
  	add_column :sales, :cash_bank_loan, :string
  	add_column :sales, :spa , :string

  end
end
