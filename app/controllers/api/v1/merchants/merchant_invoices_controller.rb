module Api
  module V1
    module Merchants
      class MerchantInvoicesController < ApiController

        def index
          respond_with Merchant.find(params[:id]).invoices
        end

      end
    end
  end
end
