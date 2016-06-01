require 'csv'
require 'bigdecimal'

namespace :import do

  desc "Imports all sales data from csv file"

  task all:[
          :customers,
          :invoice_items,
          :invoices,
          :items,
          :merchants,
          :transactions] do
  "Created Entire Database"
  end

  task customers: :environment do
    customers = "db/data/customers.csv"
    CSV.foreach(customers, headers: :true, header_converters: :symbol) do |row|
      Customer.create!(row.to_h)
      print '.'
    end
    puts "Created Customers"
  end

  task invoices: :environment do
    invoices = "db/data/invoices.csv"
    CSV.foreach(invoices, headers: :true, header_converters: :symbol) do |row|
      Invoice.create!(row.to_hash)
      print '.'
    end
    puts "Created Invoices"
  end

  task merchants: :environment do
    merchants = "db/data/merchants.csv"
    CSV.foreach(merchants, headers: :true, header_converters: :symbol) do |row|
      Merchant.create!(row.to_h)
      print '.'
    end
    puts "Created Merchants"
  end

  task transactions: :environment do
    transactions = "db/data/transactions.csv"
    CSV.foreach(transactions, headers: :true, header_converters: :symbol) do |row|
      Transaction.create!(row.to_hash.except(:credit_card_expiration_date))
      print '.'
    end
    puts "Created Transaction"
  end

  task invoice_items: :environment do
    invoice_items = "db/data/invoice_items.csv"
    CSV.foreach(invoice_items, headers: :true, header_converters: :symbol) do |row|
      InvoiceItem.create!(id: row[:id],
      item_id: row[:item_id],
      invoice_id: row[:item_id],
      quantity: row[:quantity],
      unit_price: BigDecimal.new(row[:unit_price].insert(-3, ".")),
      created_at: row[:created_at],
      updated_at: row[:updated_at])
      print '.'
    end
    puts "Created InvoiceItems"
  end

  task items: :environment do
    items = "db/data/items.csv"
    CSV.foreach(items, headers: :true, header_converters: :symbol) do |row|
      Item.create!(id: row[:id],
      name: row[:name],
      description: row[:description],
      unit_price: BigDecimal.new(row[:unit_price].insert(-3, ".")),
      merchant_id: row[:merchant_id],
      created_at: row[:created_at],
      updated_at: row[:updated_at])
      print '.'
    end
    puts "Created Items"
  end
end
