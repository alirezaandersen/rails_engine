require 'rails_helper'


RSpec.describe Api::V1::Invoices::InvoicesCustomersController do
  describe "GET customers", type: :controller do
    it "returns the associated customer" do
      first = FactoryGirl.create(:invoice, merchant_id: 1)
      first.update(customer_id: FactoryGirl.create(:customer).id)

      get :index, id: first.id, format: :json

      item = JSON.parse(response.body)

      customer = first.customer
      expect(response).to have_http_status(:success)

      expect(item).to eq({
        "id"         => customer.id,
        "first_name" => customer.first_name,
        "last_name"  => customer.last_name,
      })
    end
  end
end
