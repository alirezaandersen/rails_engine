module Api
  module V1
    module Merchants
      class MerchantsMostRevenueController < ApiController
        # GET /api/v1/merchants/most_revenue?quantity=x returns the top x merchants ranked by total revenue
        def index
          respond_with Merchant.most_revenue(params[:quantity])
        end
        
      end
    end
  end
end
