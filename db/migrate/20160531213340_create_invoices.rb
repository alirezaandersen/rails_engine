class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :customer_id
      t.integer :merchant_id
      t.citext  :status

      t.timestamps null: false
    end
  end
end
