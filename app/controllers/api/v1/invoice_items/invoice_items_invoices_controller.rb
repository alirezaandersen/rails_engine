module Api
  module V1
    module InvoiceItems
      class InvoiceItemsInvoicesController < ApiController

        def index
          respond_with InvoiceItem.find(params[:id]).invoice
        end

      end
    end
  end
end
