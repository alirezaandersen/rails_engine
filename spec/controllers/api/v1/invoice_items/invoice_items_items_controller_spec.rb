require 'rails_helper'


RSpec.describe Api::V1::InvoiceItems::InvoiceItemsItemsController do
  describe "GET items", type: :controller do
    it "returns all items related to invoice_items" do
      invoice_item = FactoryGirl.create(:invoice_item)
      invoice_item.update(item_id: FactoryGirl.create(:item).id)

      get :index, id: invoice_item.id, format: :json

      item = JSON.parse(response.body)

      expect(response).to have_http_status(:success)

      expect(item).to eq({
      "id"          => item.values[0],
      "name"        => item.values[1],
      "description" => item.values[2],
      "unit_price"  => item.values[3],
      "merchant_id" => item.values[4],
    })
    end
  end
end
