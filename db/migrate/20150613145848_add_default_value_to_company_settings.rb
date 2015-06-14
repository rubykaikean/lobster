class AddDefaultValueToCompanySettings < ActiveRecord::Migration
  def change
    change_column :company_settings, :allow_multiple_booking, :boolean, default: true 
  end
end
