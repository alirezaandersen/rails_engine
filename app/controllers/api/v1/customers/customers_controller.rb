module Api
  module V1
    module Customers
    class CustomersController < ApiController

      def index
        respond_with Customer.all
      end

      def show
        respond_with Customer.find(params[:id])
      end

      def find
        respond_with Customer.find_by(customer_params)
      end

      def find_all
        respond_with Customer.where(customer_params)
      end

      def random
        respond_with Customer.all.sample
      end

      private

      def customer_params
        params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
      end
      #params not needed for gets
    end
    end
  end
end
