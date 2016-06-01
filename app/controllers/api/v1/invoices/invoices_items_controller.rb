module Api
  module V1
    module Invoices
      class InvoicesItemsController < ApiController
        #  returns a collection of associated items
        def index
          respond_with Invoice.find(params[:id]).items
        end

      end
    end
  end
end
