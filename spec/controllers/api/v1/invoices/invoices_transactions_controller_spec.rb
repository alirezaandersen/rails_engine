require 'rails_helper'


RSpec.describe Api::V1::Invoices::InvoicesTransactionsController do
  describe "GET transactions", type: :controller do
    it "returns the associated customer related to invoice" do
    invoice = FactoryGirl.create(:invoice)
    transaction = FactoryGirl.create(:transaction, invoice_id: invoice.id)

    get :index, id:invoice.id, format: :json

    item = JSON.parse(response.body).first

    expect(response).to have_http_status(:success)
    
    expect(item).to eq({
      "id"                 => item.values[0],
      "credit_card_number" => item.values[1],
      "invoice_id"         => item.values[2],
      "result"             => item.values[3],
    })
    end
  end
end
