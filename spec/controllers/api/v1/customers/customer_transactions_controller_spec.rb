require 'rails_helper'

RSpec.describe Api::V1::Customers::CustomerTransactionsController do
  describe "GET transactions", type: :controller do
    it "returns transaction for customer" do
      customer = FactoryGirl.create(:customer)
      invoice = FactoryGirl.create(:invoice, customer_id: customer.id)
      transaction = FactoryGirl.create(:transaction, invoice_id: invoice.id)

      get :index, id: customer.id, format: :json

      items = JSON.parse(response.body).first
      # binding.pry
      expect(response).to have_http_status(:success)

      expect(items).to eq({
      "id"                 => items.values[0],
      "credit_card_number" => items.values[1],
      "invoice_id"         => items.values[2],
      "result"            => items.values[3],
    })
    end
  end
end
