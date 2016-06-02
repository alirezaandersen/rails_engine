require 'rails_helper'


RSpec.describe Api::V1::Merchants::MerchantInvoicesController do
  describe "GET merchant invoices", type: :controller do
    it "returns the associated merchant related to the item" do
    merchant = FactoryGirl.create(:merchant)
    invoice = FactoryGirl.create(:invoice, merchant_id: merchant.id)

    get :index, id:merchant.id, format: :json

    items = JSON.parse(response.body).first
    expect(response).to have_http_status(:success)
    expect(items).to eq({
      "id"          => items.values[0],
      "customer_id" => items.values[1],
      "merchant_id" => items.values[2],
      "status"      => items.values[3],
    })
    end
  end
end
