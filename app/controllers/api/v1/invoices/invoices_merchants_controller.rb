module Api
  module V1
    module Invoices
      class InvoicesMerchantsController < ApiController
        # returns the associated merchant
        def index
          respond_with Invoice.find(params[:id]).merchant
        end

      end
    end
  end
end
