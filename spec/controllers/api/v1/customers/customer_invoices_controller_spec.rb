require 'rails_helper'


RSpec.describe Api::V1::Customers::CustomerInvoicesController do
  describe "GET invoices", type: :controller do
    it "returns transaction for customer" do
      customer = FactoryGirl.create(:customer)
      get :index, id: customer.id, format: :json

      expect(response).to have_http_status(:success)
    end
  end
end
