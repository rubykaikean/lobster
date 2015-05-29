class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :registration_number, limit: 15
      t.text :address
      t.string :phone_number, limit: 15
      t.string :fax_number, limit: 15
      t.integer :type_id

      t.timestamps null: false
    end
  end
end
