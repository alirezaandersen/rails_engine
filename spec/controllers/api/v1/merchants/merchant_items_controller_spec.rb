require 'rails_helper'


RSpec.describe Api::V1::Merchants::MerchantItemsController do
  describe "GET merchant items", type: :controller do
    it "returns the associated merchant related to the item" do
    merchant = FactoryGirl.create(:merchant)
    item = FactoryGirl.create(:item, merchant_id: merchant.id)

    get :index, id:merchant.id, format: :json

    items = JSON.parse(response.body).first

    expect(response).to have_http_status(:success)
    expect(items).to eq({
      "id"          => items.values[0],
      "name"        => items.values[1],
      "description" => items.values[2],
      "unit_price"  => items.values[3],
      "merchant_id" => items.values[4],
    })
    end
  end
end
