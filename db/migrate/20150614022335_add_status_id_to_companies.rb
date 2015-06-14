class AddStatusIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :status_id, :integer, default: 1
  end
end
