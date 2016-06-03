module Api
  module V1
    module Merchants
      class MerchantsMostItemsController < ApiController
        # GET /api/v1/merchants/most_items?quantity=x returns the top x
        # merchants ranked by total number of items sold
        def index
          respond_with Merchant.most_items_sold(params[:quantity])
        end

      end
    end
  end
end
