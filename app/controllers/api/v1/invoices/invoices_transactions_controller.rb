module Api
  module V1
    module Invoices
      class InvoicesTransactionsController < ApiController
        # returns a collection of associated transactions
        def index
          respond_with Invoice.find(params[:id]).transactions
        end

      end
    end
  end
end
