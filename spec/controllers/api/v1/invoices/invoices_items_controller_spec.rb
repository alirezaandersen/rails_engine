require 'rails_helper'


RSpec.describe Api::V1::Invoices::InvoicesItemsController do
  describe "GET items", type: :controller do
    it "returns the associated customer related to invoice" do
    merchant = FactoryGirl.create(:merchant)
    invoice = FactoryGirl.create(:invoice, merchant_id: merchant.id)
    items = FactoryGirl.create(:item, merchant_id: merchant.id)


    get :index, id:invoice.id, format: :json

    item = JSON.parse(response.body).first

    expect(response).to have_http_status(:success)
    end
  end
end
