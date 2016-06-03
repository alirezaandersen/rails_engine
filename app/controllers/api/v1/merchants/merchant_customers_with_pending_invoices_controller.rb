module Api
  module V1
    module Merchants
      class MerchantCustomersWithPendingInvoicesController < ApiController

        def index
          respond_with Merchant.find(params[:id]).customers_pending_invoices
        end
        
      end
    end
  end
end
