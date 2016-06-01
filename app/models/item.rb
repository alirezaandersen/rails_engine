class Item  < ActiveRecord::Base
  belongs_to :merchants
  has_many :invoices
end
