module Api
  module V1
    module Customers
      class CustomersFavoriteMerchantController < ApiController

        def index
          respond_with Customer.find(params[:id]).favorite_merchant
        end

      end
    end
  end
end
