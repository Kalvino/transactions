class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_id, null: false
      t.integer :customer_id, null: false
      t.decimal :input_amount, null: false
      t.string :input_currency, null: false, limit: 3
      t.decimal :output_amount, null: false
      t.string :output_currency, null: false, limit: 3

      t.timestamps
    end
    add_index :transactions, :transaction_id
  end
end
