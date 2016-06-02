require 'rails_helper'


RSpec.describe Api::V1::Customers::CustomerInvoicesController do
  describe "GET invoices", type: :controller do
    it "returns transaction for customer" do
      customer = FactoryGirl.create(:customer)
      customer.invoices.create( merchant_id: 1, status: "done" )
      customer.invoices.create( merchant_id: 2, status: "pending" )

      get :index, id: customer.id, format: :json

      items = JSON.parse(response.body)

      expect(response).to have_http_status(:success)

      first_customer_invoice = items.first
      expect(first_customer_invoice).to eq({
        first_customer_invoice.keys[0]  => first_customer_invoice.values[0],
        first_customer_invoice.keys[1]  => first_customer_invoice.values[1],
        first_customer_invoice.keys[2]  => first_customer_invoice.values[2],
        first_customer_invoice.keys[3]  => first_customer_invoice.values[3],
      })
    end
  end
end
