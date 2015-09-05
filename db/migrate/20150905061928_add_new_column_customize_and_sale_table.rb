class AddNewColumnCustomizeAndSaleTable < ActiveRecord::Migration
  def change

  	add_column :sales, :cash, :string
  	add_column :sales, :government_loan, :string
  	add_column :sales, :staff_loan, :string
  	add_column :buyers, :remark, :text

  	add_column :reservation_customizations, :cash, :boolean, default: false
  	add_column :reservation_customizations, :cash_required, :boolean, default: false
    add_column :reservation_customizations, :bank_loan, :boolean, default: false
    add_column :reservation_customizations, :bank_loan_required, :boolean, default: false
  	add_column :reservation_customizations, :government_loan, :boolean, default: false
  	add_column :reservation_customizations, :government_loan_required, :boolean, default: false
  	add_column :reservation_customizations, :staff_loan, :boolean, default: false
  	add_column :reservation_customizations, :staff_loan_required, :boolean, default: false
  	add_column :reservation_customizations, :remark, :boolean, default: false
  	add_column :reservation_customizations, :remark_required, :boolean, default: false

  end
end
