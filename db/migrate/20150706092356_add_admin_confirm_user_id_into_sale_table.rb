class AddAdminConfirmUserIdIntoSaleTable < ActiveRecord::Migration
  def change

  	add_column :sales, :admin_confirm_user_id, :integer

  end
end
