module Api
  module V1
    module Merchants
      class MerchantInvoicesController < ApiController
        # returns a collection of invoices associated with that merchant from their known
        def index
          respond_with Merchant.find(params[:id]).invoices
        end

      end
    end
  end
end
