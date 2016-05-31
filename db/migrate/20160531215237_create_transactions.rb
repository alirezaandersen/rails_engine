class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.citext :result
      t.integer :invoice_id
      t.text :credit_card_number

      t.timestamps null: false
    end
  end
end
