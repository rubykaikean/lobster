class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :skey
      t.integer :tran_id
      t.string :domain
      t.string :currency
      t.datetime :paydate
      t.string :orderid
      t.string :appcode
      t.string :error_code
      t.string :error_desc
      t.string :channel
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :receipts, :user_id
  end
end
