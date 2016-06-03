class Item  < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates :unit_price, presence:true


# GET /api/v1/items/most_revenue?quantity=x
# returns the top x items ranked by total revenue generated
  def self.most_revenue(x)
    joins(:invoice_items).
    group(:id).
    order('sum(invoice_items.unit_price * invoice_items.quantity)DESC').
    limit(x)
  end


# GET /api/v1/items/most_items?quantity=x
# returns the top x item instances ranked by total number sold
  def self.most_items(x)
  joins(:invoice_items).
  group(:id).
  order("sum(invoice_items.quantity)DESC").
  limit(x)
  end

# GET /api/v1/items/:id/best_day
# returns the date with the most sales for the given item using the invoice date
  def best_day

  end
end
