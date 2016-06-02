module Api
  module V1
    module Invoices
      class InvoicesController < ApiController
        respond_to :json

        def index
          respond_with Invoice.all
        end

        def show
          respond_with Invoice.find(params[:id])
        end

        def find
          respond_with Invoice.find_by(invoice_params)
        end

        def find_all
          respond_with Invoice.where(invoice_params)
        end

        def random
          respond_with Invoice.all.sample
        end

        private

        def invoice_params
          params.permit(:customer_id, :merchant_id, :status, :created_at, :updated_at)
        end
      end
    end
  end
end
