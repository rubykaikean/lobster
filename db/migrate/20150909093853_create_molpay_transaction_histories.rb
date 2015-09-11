class CreateMolpayTransactionHistories < ActiveRecord::Migration
  def change
    create_table :molpay_transaction_histories do |t|
      t.float :amount
      t.integer :status
      t.string :bill_name
      t.string :bill_email
      t.string :bill_mobile
      t.string :bill_desc
      t.integer :tran_id
      t.string :domain
      t.string :currency
      t.datetime :paydate
      t.string :order_id, unique: true
      t.string :appcode
      t.string :error_code
      t.string :error_desc
      t.string :channel
      t.string :skey
      t.integer :sale_id

      t.timestamps null: false
    end
    add_index :molpay_transaction_histories, :sale_id
  end
end
