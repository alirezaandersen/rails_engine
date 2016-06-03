module Api
  module V1
    module Merchants
      class MerchantFavoriteCustomerController < ApiController

        def index
          respond_with Merchant.find(params[:id]).favorite_customer
        end
      end
    end
  end
end
