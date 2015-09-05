class CreateMolpayTransactionHistories < ActiveRecord::Migration
  def change
    create_table :molpay_transaction_histories do |t|
      t.integer :order_id
      t.float :amount
      t.boolean :is_paid
      t.boolean :status
      t.string :bill_name
      t.string :bill_email
      t.string :bill_mobile

      t.timestamps null: false
    end
  end
end
