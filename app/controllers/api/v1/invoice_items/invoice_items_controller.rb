module Api
  module V1
    module InvoiceItems
      class InvoiceItemsController < ApiController

        def index
          respond_with InvoiceItem.all
        end

        def show
          respond_with InvoiceItem.find(params[:id])
        end

        def find
          respond_with InvoiceItem.find_by(invoice_items_params)
        end

        def find_all
          respond_with InvoiceItem.where(invoice_items_params)
        end

        def random
          respond_with InvoiceItem.all.sample
        end

        private

        def invoice_items_params
          params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
        end
      end
    end
  end
end
