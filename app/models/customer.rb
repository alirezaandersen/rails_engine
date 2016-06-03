class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

# GET /api/v1/customers/:id/favorite_merchant
# returns a merchant where the customer has conducted the most successful transactions

  def favorite_merchant
    # binding.pry
    #
    merchants.select("merchants.*, count(invoices.merchant_id) AS merch_count")
                       .joins(invoices: :transactions)
                       .group("merchants.id")
                       .order("merch_count DESC")
                       .first
    # merchant_id = invoices.joins(:transactions).group(:merchant_id).count.sort_by { |k,v| v}.last.to_i
    # Merchant.find(merchant_id)
  end

end
