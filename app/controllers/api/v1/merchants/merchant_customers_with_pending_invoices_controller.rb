module Api
  module V1
    module Merchants
      class MerchantCustomersWithPendingInovices < ApiController

        def index
          respond_with Merchant.find(params[:merchant_id]).customers_pending_invoices
        end
      end
    end
  end
end
