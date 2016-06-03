module Api
  module V1
    module Merchants
      class MerchantsRevenueDateController < ApiController
        # GET /api/v1/merchants/revenue?date=x
         # returns the total revenue for date x across all merchants
        def index
          respond_with Merchant.revenue_by_date(params[:date])
        end

      end
    end
  end
end
