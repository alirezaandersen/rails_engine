module Api
  module V1
    module Customers
      class CustomerInvoicesController < ApiController
        # returns a collection of associated invoices
        def index
        respond_with Customer.find(params[:id]).invoices
        end
        
      end
    end
  end
end
