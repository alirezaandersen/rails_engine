module Api
  module V1
    module InvoiceItems
      class InvoiceItemsItemsController < ApiController

        def index
          respond_with InvoiceItem.find(params[:id]).item
        end

      end
    end
  end
end
