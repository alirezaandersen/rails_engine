require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::InvoiceItemsInvoicesController do
  describe "GET invoices", type: :controller do
    it "returns all invoices related to invoice_items" do
      invoice_item = FactoryGirl.create(:invoice_item)
      invoice_item.update(item_id: FactoryGirl.create(:item).id)

      get :index, id: invoice_item.id, format: :json

      item = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(item).to eq({
         "id"          => item.values[0],
         "customer_id" => item.values[1],
         "merchant_id" => item.values[2],
         "status"      => item.values[3],
     })
    end
  end
end
