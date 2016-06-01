module Api
  module V1
    module Items
      class ItemsInvoiceItemsController < ApiController
        # returns the associated merchant
        def index
          respond_with Item.find(params[:id]).invoice_items
        end

      end
    end
  end
end
