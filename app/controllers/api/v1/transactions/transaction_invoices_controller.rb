module Api
  module V1
    module Transactions
      class TransactionInvoicesController < ApiController
        #  returns the associated invoice
        def index
          respond_with Transaction.find(params[:id]).invoice
        end

      end
    end
  end
end
