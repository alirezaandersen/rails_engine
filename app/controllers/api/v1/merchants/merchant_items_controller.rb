module Api
  module V1
    module Merchants
      class MerchantItemsController < ApiController
        # returns a collection of items associated with that merchant
        def index
          respond_with Merchant.find(params[:id]).items
        end

      end
    end
  end
end
