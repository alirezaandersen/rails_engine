module Api
  module V1
    module Invoices
      class InvoicesInvoiceItemsController < ApiController
        # returns a collection of associated invoice items
        def index
          respond_with Invoice.find(params[:id]).invoice_items
        end

      end
    end
  end
end
