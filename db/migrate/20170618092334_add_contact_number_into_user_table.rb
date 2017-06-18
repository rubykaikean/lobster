class AddContactNumberIntoUserTable < ActiveRecord::Migration
  def change

  	add_column :users, :mobile_contact_number, :string

  	add_column :users, :work_contact_number, :string

  	add_column :users, :home_contact_number, :string

  end
end
