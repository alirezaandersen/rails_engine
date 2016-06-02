require 'rails_helper'


RSpec.describe Api::V1::InvoiceItems::InvoiceItemsItemsController do
  describe "GET items", type: :controller do
    it "returns all items related to invoice_items" do
      invoice_item = FactoryGirl.create(:invoice_item)

      get :index, id: invoice_item.id, format: :json

      item = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
    end
  end
end
