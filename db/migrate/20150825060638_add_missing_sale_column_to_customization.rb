class AddMissingSaleColumnToCustomization < ActiveRecord::Migration
  def change

  	add_column :reservation_customizations, :sale_person, :boolean, default: false
  	add_column :reservation_customizations, :sale_person_required, :boolean, default: false
  	add_column :reservation_customizations, :payment_type, :boolean, default: false
  	add_column :reservation_customizations, :payment_type_required, :boolean, default: false

  end
end
