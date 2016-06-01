module Api
  module V1
    module Invoices
      class InvoicesCustomersController < ApiController
        # returns the associated customer
        def index
          respond_with Invoice.find(params[:id]).customer
        end
        
      end
    end
  end
end
