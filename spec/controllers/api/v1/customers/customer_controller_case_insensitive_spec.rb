require 'rails_helper'


RSpec.describe Api::V1::Customers::CustomersController do
  describe "find_all" do
    it "responds with all customers matching passed name (case insensitive)" do
      customer = FactoryGirl.create(:customer)
      name = customer.update(first_name:"ali")
      get :find_all, format: :json, name: name

      items = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(items.count).to eq 1
    end
  end
end
