module Api
  module V1
    module Customers
      class CustomerTransactionsController < ApiController
        # returns a collection of associated transactions
        def index
          respond_with Customer.find(params[:id]).transactions
        end
      end
    end
  end
end
