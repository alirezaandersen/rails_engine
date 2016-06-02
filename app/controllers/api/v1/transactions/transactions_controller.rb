module Api
  module V1
    module Transactions
      class TransactionsController < ApiController

        def index
          respond_with Transaction.all
        end

        def show
          respond_with Transaction.find(params[:id])
        end

        def find
          respond_with Transaction.find_by(transaction_params)
        end

        def find_all
          respond_with Transaction.where(transaction_params)
        end

        def random
          respond_with Transaction.all.sample
        end

        private

        def transaction_params
          params.permit(:id, :result, :invoice_id, :credit_card_number, :created_at, :updated_at)
        end
      end
    end
  end
end
