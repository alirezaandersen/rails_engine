require 'rails_helper'


RSpec.describe Api::V1::Customers::CustomersController do
  describe "GET index", type: :controller do
    it "returns all customers" do
      customer1 = FactoryGirl.create(:customer)
      customer2 = FactoryGirl.create(:customer)
      customer2.update(first_name:"Alireza")
      get :index, format: :json

      items = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(Customer.count).to eq(2)
      expect(Customer.last.first_name).to eq("Alireza")
      expect(Customer.first.first_name).to eq("Ali")
    end
  end

  describe "Get Show", type: :controller do
    it "returns all specific customer"do
      customer = FactoryGirl.create(:customer)
      get :show, id: customer.id, format: :json

      item = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(Customer.first.first_name).to eq("Ali")
    end
  end

  describe "Get Find", type: :controller do
    it "can find customer based on match query" do
      customer = FactoryGirl.create(:customer)
      get :find, id: customer.id, format: :json

      item = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(Customer.first.first_name).to eq("Ali")
    end
  end

  describe "Get Find_all", type: :controller do
    it "can find customer based on any customer query" do
    customer = FactoryGirl.create(:customer)

    get :find_all, id: customer.id, format: :json

      item = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(Customer.first.first_name).to eq("Ali")
    end
  end

  describe "GET #random", type: :controller do
    it "returns a random customer" do
      FactoryGirl.create_list(:customer, 12)

      get :random, format: :json

      expect(response).to be_success
    end
  end

end
