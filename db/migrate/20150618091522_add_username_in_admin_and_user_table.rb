class AddUsernameInAdminAndUserTable < ActiveRecord::Migration
  def change
  	add_column :users, :username, :string

  	add_column :admins, :username, :string

  	add_column :buyers, :is_bumi_putera, :boolean, default: false

  end
end
