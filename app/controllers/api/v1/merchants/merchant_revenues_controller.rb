module Api
  module V1
    module Merchants
      class MerchantRevenuesController < ApiController
        # GET /api/v1/merchants/:id/revenue returns the total revenue for that merchant across all transactions
        # GET /api/v1/merchants/:id/revenue?date=x returns the total revenue for that merchant for a specific invoice date x
        def index
          respond_with Merchant.revenue(params[:date])
        end
      end
    end
  end
end
