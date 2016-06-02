require 'rails_helper'


RSpec.describe Api::V1::Items::ItemsMerchantsController do
  describe "GET invoice_items", type: :controller do
    it "returns the associated merchant related to the item" do
    merchant = FactoryGirl.create(:merchant)
    item = FactoryGirl.create(:item, merchant_id: merchant.id)

    get :index, id:item.id, format: :json

    items = JSON.parse(response.body)

    expect(response).to have_http_status(:success)
    expect(items).to eq({
      "id"   => items.values[0],
      "name" => items.values[1],
    })
    end
  end
end
