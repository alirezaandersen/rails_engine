require 'rails_helper'


RSpec.describe Api::V1::Invoices::InvoicesMerchantsController do
  describe "GET merchants", type: :controller do
    it "returns the associated customer related to invoice" do
    merchant = FactoryGirl.create(:merchant)
    invoice = FactoryGirl.create(:invoice, merchant_id: merchant.id)
    items = FactoryGirl.create(:item, merchant_id: merchant.id)


    get :index, id:invoice.id, format: :json
    item = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(item).to eq({
    "id"      => item.values[0],
    "name"    => item.values[1],
  })
    end
  end
end
