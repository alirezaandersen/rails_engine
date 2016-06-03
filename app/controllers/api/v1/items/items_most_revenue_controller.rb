module Api
  module V1
    module Items
      class ItemsMostRevenueController < ApiController
        # GET /api/v1/items/most_revenue?quantity=x
        # returns the top x items ranked by total revenue generated
        def index
          respond_with Item.most_revenue(params[:quantity])
        end
      end
    end
  end
end
