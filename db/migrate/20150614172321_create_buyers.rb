class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.string :full_name
      t.string :ic_number
      t.text :address
      t.string :mobile_contact_number
      t.string :home_contact_number
      t.string :office_contact_number
      t.string :email
      t.integer :status_id
      t.integer :sale_id

      t.timestamps null: false
    end
    add_index :buyers, :sale_id
  end
end
