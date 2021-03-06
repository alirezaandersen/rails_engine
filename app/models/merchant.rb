class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  # # GET /api/v1/merchants/most_items?quantity=x returns the top x
  # # merchants ranked by total number of items sold

  def self.most_items_sold(x)
    joins(invoices: [:transactions, :invoice_items]).
    where(transactions: {result: "success"}).
    group(:id).
    order("sum(invoice_items.quantity)DESC").
    limit(x)
  end
  # # GET /api/v1/merchants/most_revenue?quantity=x returns
  # # the top x merchants ranked by total revenue

  def self.most_revenue(x)
    joins(invoices: [:transactions, :invoice_items]).
    where(transactions: {result: "success"}).
    group(:id).
    order("sum(invoice_items.quantity * invoice_items.unit_price)DESC").
    limit(x)
  end
  # # GET /api/v1/merchants/revenue?date=x
  # # returns the total revenue for date x across all merchants
  def self.revenue_by_date(date)
    revenue = joins(invoices: [:transactions, :invoice_items]).
    where(transactions: {result: "success"}).
    where("invoices.created_at = ?", date).
    sum("invoice_items.quantity * invoice_items.unit_price")
    return {"total_revenue" => revenue}
  end
  # # GET /api/v1/merchants/:id/revenue returns the total revenue
  # # for that merchant across all transactions
  def self.revenue(date = nil)
    if date.nil?
      revenue = Invoice.joins(:transactions).
      where(transactions: {result: "success"}).
      uniq.includes(:invoice_items).
      sum("quantity * unit_price")
      return { "revenue" => revenue }
    else
      revenue = Invoice.joins(:transactions).
      where(transactions: {result: "success"}).
      where("invoices.created_at = ?", date).
      uniq.includes(:invoice_items).
      sum("quantity * unit_price")
      return { "revenue" => revenue }
    end
  end

  # GET /api/v1/merchants/:id/favorite_customer
  # returns the customer who has conducted the most total number of successful transactions
  def favorite_customer
    customers.
    joins(:transactions).
    where(transactions: {result: "success"}).
    group(:id).
    order("transactions.count").last
  end

  # GET /api/v1/merchants/:id/customers_with_pending_invoices
  # returns a collection of customers which have pending (unpaid) invoices
  def customers_pending_invoices
    invoice_ids = invoices.pluck(:id)
    failed_transactions = Transaction.where(invoice_id: invoice_ids).where(result: "failed")
    customer_ids = Invoice.where(id: failed_transactions.pluck(:invoice_id)).pluck(:customer_id)
    Customer.where(id: customer_ids)
  end

end
