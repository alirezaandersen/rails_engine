module Api
  module V1
    module Merchants
      class MerchantsController < ApiController

        def index
          respond_with Merchant.all
        end

        def show
          respond_with Merchant.find(params[:id])
        end

        def find
          respond_with Merchant.find_by(merchant_params)
        end

        def find_all
          respond_with Merchant.where(merchant_params)
        end

        def random
          respond_with Merchant.all.sample
        end

        private

        def merchant_params
          params.permit(:id, :name, :created_at, :updated_at)
        end
      end
    end
  end
end
