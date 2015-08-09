class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :sale_id
      t.attachment :image

      t.timestamps null: false
    end
  end
end
