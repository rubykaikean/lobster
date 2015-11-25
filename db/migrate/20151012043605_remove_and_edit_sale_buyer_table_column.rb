class RemoveAndEditSaleBuyerTableColumn < ActiveRecord::Migration
  def change
  
  	remove_column :sales, :staff_loan
  	remove_column :sales, :cash
  	remove_column :sales, :government_loan
  	remove_column :sales, :bank_loan

  	remove_column :reservation_customizations, :staff_loan
  	remove_column :reservation_customizations, :cash
  	remove_column :reservation_customizations, :government_loan
  	remove_column :reservation_customizations, :bank_loan

  	remove_column :reservation_customizations, :staff_loan_required
  	remove_column :reservation_customizations, :cash_required
  	remove_column :reservation_customizations, :government_loan_required
  	remove_column :reservation_customizations, :bank_loan_required

  	remove_column :sales, :downpayment_type
    add_column :sales, :payment_type_id, :integer


  	add_column :sales, :chq_number, :string
  	add_column :sales, :credit_card_number, :string

  end
end
