require 'rails_helper'


RSpec.describe Api::V1::Transactions::TransactionInvoicesController do
  describe "GET transaction invoice", type: :controller do
    it "returns the associated invoice related to the transaction" do
    invoice = FactoryGirl.create(:invoice)
    transaction = FactoryGirl.create(:transaction, invoice_id: invoice.id)

    get :index, id:transaction.id, format: :json

    items = JSON.parse(response.body)

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
