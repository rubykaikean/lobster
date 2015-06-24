class AddConfirmDateToSales < ActiveRecord::Migration
  def change
    add_column :sales, :confirm_date, :datetime
  end
end
