module Api
  module V1
    module Items
      class ItemsMerchantsController < ApiController
        # returns a collection of associated invoice items
        def index
          respond_with Item.find(params[:id]).merchant
        end
      end
    end
  end
end
