module Api
  module V1
    module Items
      class ItemsMostItemsController < ApiController
      # GET /api/v1/items/most_items?quantity=x
      # returns the top x item instances ranked by total number sold
      def index
        respond_with Item.most_items(params[:quantity])
      end
      end
    end
  end
end
