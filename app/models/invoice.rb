class Invoice < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer
  has_many :transactions
end
