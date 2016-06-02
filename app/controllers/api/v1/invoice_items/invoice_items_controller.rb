module Api
  module V1
    module InvoiceItems
      class InvoiceItemsController < ApiController
        respond_to :json

        def index
          respond_with InvoiceItem.all
        end

        def show
          respond_with InvoiceItem.find(params[:id])
        end

        def find
          respond_with InvoiceItem.find_by(invoice_item_params)
        end

        def find_all
          repsond_with InvoiceItem.where(invoice_item_parms)
        end

        private

        def inovice_items_params
          params.permit(:item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
        end
      end
    end
  end
end
